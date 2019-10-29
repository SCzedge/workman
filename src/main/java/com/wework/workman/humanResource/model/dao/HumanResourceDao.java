package com.wework.workman.humanResource.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.common.Attachment;
import com.wework.workman.common.PageInfo;
import com.wework.workman.humanResource.model.vo.Department;
import com.wework.workman.humanResource.model.vo.Employee;
import com.wework.workman.humanResource.model.vo.Notice;

@Repository("humanResourceDao")
public class HumanResourceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getnListCount() {

		return sqlSession.selectOne("humanMapper.getnListCount");
	}

	public ArrayList<Notice> selectnList(PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("humanMapper.selectnList", null, rowBounds);

	}
	
	public Notice getnDetail(String noticeNum) {

		return sqlSession.selectOne("humanMapper.selectNotice", noticeNum);
	}
	
	public int updateNotice(Notice n) {
		
		return sqlSession.update("humanMapper.updateNotice", n);
	}


	public int gethListCount() {

		return sqlSession.selectOne("humanMapper.gethListCount");
	}

	public ArrayList<Notice> selectHRnList(PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("humanMapper.selectHRnList", null, rowBounds);

	}

	public Notice gethrnDetail(String noticeNum) {

		return sqlSession.selectOne("humanMapper.selectNotice", noticeNum);
	}

	public int insertNotice(Notice n) {

		return sqlSession.insert("humanMapper.insertNotice", n);
	}

	public int insertAtt(Attachment a) {

		return sqlSession.insert("humanMapper.insertAtt", a);
	}

	public ArrayList<Department> selectDeptList() {

		return (ArrayList) sqlSession.selectList("humanMapper.selectDeptList");
	}

	public ArrayList<Employee> selectEmp() {

		return (ArrayList) sqlSession.selectList("humanMapper.selectEmp");
	}

	public ArrayList<Employee> getEmpCount() {

		return (ArrayList) sqlSession.selectList("humanMapper.selectEmpCount");
	}
}
