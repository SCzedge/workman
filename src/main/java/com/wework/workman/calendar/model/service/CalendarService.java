package com.wework.workman.calendar.model.service;

import com.wework.workman.calendar.model.vo.Calendar;

public interface CalendarService {

		int insertCalendar(Calendar c); // �������
		
		int updateCalendar(int emp_num); // ��������
		
		Calendar calendarDetail(int emp_num); // �����󼼺���
		
		int deleteCalendar(int emp_num); // ��������
}
