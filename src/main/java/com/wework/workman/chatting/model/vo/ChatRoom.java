package com.wework.workman.chatting.model.vo;

import java.util.UUID;

public class ChatRoom {
	private String roomId;
	private String name;
	
	public static ChatRoom create(String name) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.roomId = UUID.randomUUID().toString();
		chatRoom.name = name;
		return chatRoom;
	}
	public ChatRoom() {
		
	}
	public ChatRoom(String roomId, String name) {
		super();
		this.roomId = roomId;
		this.name = name;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
