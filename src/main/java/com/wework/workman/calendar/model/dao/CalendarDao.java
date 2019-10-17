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
		return sqlSession.insert("calendarMapper.insertCalendar", c);
	}
	
	// ��������
	public int updateCalendar(int _id) {
		return sqlSession.update("calendarMapper.updateCalendar", _id);
	}
	
	// �����󼼺���
	public Calendar CalendarDetail(int _id) {
		return sqlSession.selectOne("calendarMapper.CalendarDetail", _id);
	}
	
	// ��������
	public int deleteCalendar(int _id) {
		return sqlSession.update("calendarMapper.deleteCalendar", _id);
	}
}


