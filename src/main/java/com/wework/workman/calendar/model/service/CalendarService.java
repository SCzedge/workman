package com.wework.workman.calendar.model.service;

import com.wework.workman.calendar.model.vo.Calendar;

public interface CalendarService {

		int insertCalendar(Calendar c); // �������
		
		int updateCalendar(int _id); // ��������
		
		Calendar CalendarDetail(int _id); // �����󼼺���
		
		int deleteCalendar(int _id); // ��������
}
