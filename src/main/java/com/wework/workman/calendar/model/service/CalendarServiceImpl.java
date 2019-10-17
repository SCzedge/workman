package com.wework.workman.calendar.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.calendar.model.dao.CalendarDao;
import com.wework.workman.calendar.model.vo.Calendar;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {
	@Resource(name="calendarDao")
	private CalendarDao cDao;

	@Override // �������
	public int insertCalendar(Calendar c) {
		
		return cDao.insertCalendar(c);
	}

	@Override // ��������
	public int updateCalendar(int _id) {
	
		return cDao.updateCalendar(_id);
	}

	@Override // �����󼼺���
	public Calendar CalendarDetail(int _id) {
		
		return cDao.CalendarDetail(_id);
	}

	@Override // ��������
	public int deleteCalendar(int _id) {
		
		return cDao.deleteCalendar(_id);
	}
}
