package com.wework.workman.calendar.model.service;

import com.wework.workman.calendar.model.vo.Calendar;

public interface CalendarService {

		int insertCalendar(Calendar c); // �������
		
		int updateCalendar(int empNum); // ��������
		
		Calendar calendarDetail(int empNum); // �����󼼺���
		
		int deleteCalendar(int empNum); // ��������
}
