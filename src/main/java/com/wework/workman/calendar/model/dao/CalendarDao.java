package com.wework.workman.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.calendar.model.vo.Calendar;

@Repository("calendarDao")
public class CalendarDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// �������
	public int insertCalendar(Calendar c) {
		return sqlSession.insert("calendar-mapper.insertCalendar", c);
	}
	
	// ��������
	public int updateCalendar(int empNum) {
		return sqlSession.update("calendar-mapper.updateCalendar", empNum);
	}
	
	// �����󼼺���
	public Calendar calendarDetail(int empNum) {
		return sqlSession.selectOne("calendar-mapper.calendarDetail", empNum);
	}
	
	// ��������
	public int deleteCalendar(int empNum) {
		return sqlSession.update("calendar-mapper.deleteCalendar", empNum);
	}
}


