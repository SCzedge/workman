package com.wework.workman.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.calendar.model.vo.Attendance;

@Repository("attendanceDao")
public class AttendanceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// ��ٵ��
		public int insertAttendance(Attendance a) {
			return sqlSession.insert("calendar-mapper.insertAttend", a);
		}
		
	// ��ٵ��
		public int insertOut(Attendance a) {
			return sqlSession.insert("calendar-mapper.insertAttend", a);
		}
}
