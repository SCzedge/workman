package com.wework.workman.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.wework.workman.chatting.model.service.ChattingService;
import com.wework.workman.chatting.model.vo.Message;
import com.wework.workman.chatting.model.vo.Room;

public class WebSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private ChattingService cService;
	
	//sessionId, session
	private Map<String, WebSocketSession> allUsers = new ConcurrentHashMap<>();
	//userId,sessionId
	private Map<String,String> userSessionId = new ConcurrentHashMap<>();
	//userId,roomId - 접속중인user:actiRoomId
	private Map<String,String> userRoom = new ConcurrentHashMap<>();
	String userId;
	String systemId;
	
	// msgHandler
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException, InterruptedException, ExecutionException {
		String[] spMsg=message.getPayload().split(":");
		String preMsg=spMsg[0];
		System.out.println("handlerMessage - "+message.getPayload());
		if(preMsg.equals("onOpen")) {//소켓연결되자마자 초기세팅.
			//onOpen:userId
			userId=spMsg[1];//userId 세팅.
			userSessionId.put(userId,session.getId());//id랑 session을 sessionId로 매칭
			String roomId=getRoomList(session,userId);//룸리스트 전달
			msgHistory(session,roomId,userId);//마지막 룸의 메세지 리스트들 전송
			
		}else if(preMsg.equals("rCng")){//룸 변경
			//rCng:roomId;
			//룸변경 등 상관없이 보낸메세지는 무조건 jsp단에서 active class 에append
			String roomId=spMsg[1];
			msgHistory(session,roomId,userId);
			
		}else if(preMsg.equals("newChat")){//룸생성
			//newChat:empList
			String newRoomId= newChat(userId,spMsg[1]);
			Room r = cService.getRoom(newRoomId);
			String roomSetList = "roomSetList:"+r.getRoomId()+":"+r.getRoomName()+":"+ r.getLastWord()+":"+r.getLastMan()+":"+r.getLastComm();
			TextMessage tx = new TextMessage(roomSetList);
			msgSend(session,tx,userId);
		}else if(preMsg.equals("exitRoom")) {//룸나가기
			//exitRoom:roomId
		}else if(preMsg.equals("addUsers")) {//유저 추가
//			addUser(roomId);
		}else if(preMsg.equals("msg")){
//			msg:userId:RoomId:msgCont
			msgDb(message);
			msgSendHandler(session,message,userId);
		}else {
		}
	}
	
	
	// onOpen
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws IOException, InterruptedException, ExecutionException {
		allUsers.put(session.getId(), session);
		systemId = cService.sysId();
	}

	// onClose
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		allUsers.remove(session.getId());
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) {
		System.out.println("exception! : " + exception);
	}
	
	//sendHandler
	public void msgSendHandler(WebSocketSession session, TextMessage message,String uId) throws IOException{
//		msg:userId:RoomId:msgCont
		String[] spData = message.getPayload().split(":",4);
		String rId= spData[2];
		for(String key : userRoom.keySet()) {
			String value = userRoom.get(key);
			if(value.equals(rId)) {
				//저걸 그대로 보내니까 문제가 생기는거아냐. 다시 확인해
				TextMessage tx = new TextMessage("msg:"+spData[1]+":"+spData[3]);
				msgSend(session,tx,uId);
			}else {
				//모든사용자에게 알람을 보내고 jsp단에서 처리
				String al = "alam:"+rId;
				TextMessage tx = new TextMessage(al);
				msgSendAll(session,tx);
			}
		}
	}
	//user 1명에게 메세지전송(값세팅)
	public void msgSend(WebSocketSession session, TextMessage message,String uId) throws IOException {
		WebSocketSession s = allUsers.get(userSessionId.get(uId));
		s.sendMessage(message);
		
	}
	//모든사용자에게 보내기
	public void msgSendAll(WebSocketSession session, TextMessage message) throws IOException {
		for (WebSocketSession s : allUsers.values()) {
			s.sendMessage(message);
		}
		
	}

	/*-------------------------------------------------------------------------------*/
	
	//초기세팅 : 룸리스트 전달하기.
	public String getRoomList(WebSocketSession session,String uId) throws IOException  {
		String roomId="";
		ArrayList<Room> roomList= cService.getRoomList(uId);
		System.out.println(roomList);
		
		if(!roomList.isEmpty() && !roomList.toString().equals("[null]")) {
			for(Room i : roomList) {
				String rId=i.getRoomId();
				String rName =i.getRoomName();
				String lastWord=i.getLastWord();
				String lastMan=i.getLastMan();
				String lastComm=i.getLastComm().toString();
				String roomSetList="roomSetList:"+rId +":"+rName+":"+ lastWord+":"+lastMan+":"+lastComm;
				TextMessage tx = new TextMessage(roomSetList);
				msgSend(session,tx,uId);
				roomId = i.getRoomId();
			}	
		}
		return roomId;
	}
	//초기세팅 : 마지막 룸 지난메세지 전송
	//룸변경시 : 룸아이디로 지난 메세지 전송
	public void msgHistory(WebSocketSession session,String roomId,String uId) throws IOException {
		ArrayList<Message> msg = cService.msgHistory(roomId);
		userRoom.put(uId, roomId);
		for(Message i:msg) {
			String sender = i.getSender();
			String content= i.getMsgCont();
			String time = i.getMsgTime().toString();
			String status;
			if(i.getStatus().equals("Y")) {
				status=i.getStatus();
			}else {
				status="삭제된메세지입니다.";
			}
			String msgHistory = "msgHistory:"+sender+":"+content+":"+time+":"+status;
			TextMessage tx = new TextMessage(msgHistory);
			msgSend(session,tx,uId);
		}
	}

	public String newChat(String uId,String users) {
		String[] usersArr =users.split(",");
		String newRoomId = cService.newChat(uId);
		addUsers(newRoomId,usersArr);
		String cont = uId+"님이 "+users+"님을 초대하였습니다.";
		TextMessage tx = new TextMessage("msg:"+systemId+":"+newRoomId+":"+cont);
		msgDb(tx);
		
		
		
		
		return newRoomId;//생성된roomId반환
	}

	public void exitRoom() {
	}
	
	public void addUsers(String roomId,String[] uIds) {
		for(int i=0; i<uIds.length;i++) {
			String uId =uIds[i];
			cService.addUser(roomId,uId);
		}
		//메세지 추가하기.
	}
//	msg:userId:RoomId:msgCont
	public void msgDb(TextMessage message) {
		Message msg = new Message();
		String[] msgArr = message.getPayload().split(":");
		String uId = msgArr[1];
		String roomId = msgArr[2];
		String msgCont = msgArr[3];
		msg.setSender(uId);
		msg.setRoomId(roomId);
		msg.setMsgCont(msgCont);
		cService.msgDb(msg);
	};


}
