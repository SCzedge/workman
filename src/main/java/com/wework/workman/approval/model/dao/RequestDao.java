package com.wework.workman.approval.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.approval.model.vo.ApprovalSort;
import com.wework.workman.approval.model.vo.Request;
import com.wework.workman.approval.model.vo.RequestSort;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.ConflrmSort;
import com.wework.workman.common.Reference;

@Repository("requestDao")
public class RequestDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ConflrmSort insertConflrm(Conflrm c) {
		int result = sqlSession.insert("approvalMapper.insertConflrm", c);
		ConflrmSort cs = sqlSession.selectOne("approvalMapper.conflrmSort");
		return cs; 
	}

	public RequestSort insertRequest(Request r) {
		
		int result = sqlSession.insert("approvalMapper.insertRequest", r);
		RequestSort rc = sqlSession.selectOne("approvalMapper.requestSort");
		return rc;
	}

	public int insertAttachment(Attachment a) {
		return sqlSession.insert("approvalMapper.insertAttachment", a);
	}

	public int insertReference(Reference rf) {
		return sqlSession.insert("approvalMapper.insertReference", rf);
	}

	public Request selectRequest(String requestNum) {
		return sqlSession.selectOne("approvalMapper.selectRequest", requestNum);
	}

	public Conflrm selectConflrm(String confirmNum) {
		return sqlSession.selectOne("approvalMapper.selectConflrm",confirmNum);
	}

	public Reference selectReference(String requestNum) {
		return sqlSession.selectOne("approvalMapper.selectReference", requestNum);
	}

	public Attachment selectAttachment(String requestNum) {
		return sqlSession.selectOne("approvalMapper.selectAttachment", requestNum);
	}
	
	public int updateConflrm1(String confirmNum, String docNum) {
		int result1 = sqlSession.update("approvalMapper.updateConflrm1",confirmNum );
		int result2 = sqlSession.update("approvalMapper.progressRequest", docNum);
		return result1;
	}

	public int updateConflrm2(String confirmNum) {
		return sqlSession.update("approvalMapper.updateConflrm2",confirmNum );
	}

	public int updateConflrm3(String confirmNum) {
		return sqlSession.update("approvalMapper.updateConflrm3",confirmNum );
	}
	public int updateConflrm4(String confirmNum) {
		return sqlSession.update("approvalMapper.updateConflrm4",confirmNum );
	}

	public int insertApproval(String requestNum) {
		int result = sqlSession.insert("approvalMapper.insertApproval", requestNum);
		ApprovalSort as = sqlSession.selectOne("approvalMapper.approvalSort");
		
		HashMap<String, String> select = new HashMap<>();
		
		select.put("requestNum", requestNum);
		select.put("approvalNum", as.getApprovalNum());
		
		int result2 = sqlSession.update("approvalMapper.completeRequest",select);
		
		
		return result2;
	}
}
