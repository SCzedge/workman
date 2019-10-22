package com.wework.workman.calendar.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wework.workman.calendar.model.service.CalendarService;
import com.wework.workman.calendar.model.vo.Calendar;

@Controller("calendarController")
public class CalendarController {
	@Resource(name="calendarService")
	private CalendarService cService;
	
	
	// Ķ���� �󼼺��� ��
	@RequestMapping("calDetailView.wo") 
	public String calendarDetailView() { 
		
		return "calendar/calendarDetailView"; 
	}
	  
	  
	// ���� �󼼺���-----
	@RequestMapping("cDetail.wo")
	public ModelAndView CalendarDetail(int _id, ModelAndView mv) {
		
		Calendar c = cService.CalendarDetail(_id);
		
		if(c != null) {
			mv.addObject("c",c).setViewName("calendar/CalendarDetailView");
		}else {
			mv.addObject("msg","�Խñ� ����ȸ ����").setViewName("common/404error");
		}
		
		return mv;
	}
  
	  
	// ������� ��
	 @RequestMapping("calInsertView.wo") 
	 public String calendarInsertView() { 
		 
		return "calendar/calendarInsertView"; 
	}
	 
	
	// �������
	@RequestMapping("calInsert.wo")
	public String insertBoard(Calendar c, HttpServletRequest request, Model model) {
		
		int result = cService.insertCalendar(c);
		
		if(result > 0) {
			return "redirect:calDetail.wo";
		}else {
			model.addAttribute("msg", "�Խ��� �ۼ� ����!!");
			return "common/404error";
		}
		
	}
	
	
	// ��������------
	@RequestMapping("calUpdate.wo")
	public String updateCalendar(int _id, HttpServletRequest request) {
		
		int result = cService.deleteCalendar(_id);
		
		if(result > 0) {
			return "redirect:calDetail.wo";
		}else {
			return "common/404error";
		}
	}
	
	// ��������-------
	@RequestMapping("calDelete.wo")
	public String CalendarDelete(int _id, HttpServletRequest request) {
		
		int result = cService.deleteCalendar(_id);
		
		if(result > 0) {
			return "redirect:calDetail.wo";
		}else {
			return "common/404error";
		}
	}
}
