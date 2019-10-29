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
	public int updateCalendar(int emp_num) {
	
		return cDao.updateCalendar(emp_num);
	}

	@Override // �����󼼺���
	public Calendar calendarDetail(int emp_num) {
		
		return cDao.calendarDetail(emp_num);
	}

	@Override // ��������
	public int deleteCalendar(int emp_num) {
		
		return cDao.deleteCalendar(emp_num);
	}

}
