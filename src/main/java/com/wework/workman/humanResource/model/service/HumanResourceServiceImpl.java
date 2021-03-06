package com.wework.workman.humanResource.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.wework.workman.account.model.dao.AccountDao;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.PageInfo;
import com.wework.workman.humanResource.model.dao.HumanResourceDao;
import com.wework.workman.humanResource.model.vo.AllHoli;
import com.wework.workman.humanResource.model.vo.Att;
import com.wework.workman.humanResource.model.vo.Department;
import com.wework.workman.humanResource.model.vo.Dept;
import com.wework.workman.humanResource.model.vo.Employee;
import com.wework.workman.humanResource.model.vo.Grade;
import com.wework.workman.humanResource.model.vo.HoliCount;
import com.wework.workman.humanResource.model.vo.Modal;
import com.wework.workman.humanResource.model.vo.MyHoli;
import com.wework.workman.humanResource.model.vo.Notice;
import com.wework.workman.humanResource.model.vo.UseHoli;

@Service("humanResourceService")
public class HumanResourceServiceImpl implements HumanResourceService{
	@Resource(name="humanResourceDao")
	private HumanResourceDao hDao;
	@Resource(name="accountDao")
	private AccountDao aDao;
	
	@Override
	public int getnListCount() {

		return hDao.getnListCount();
	}

	@Override
	public ArrayList<Notice> selectnList(PageInfo pi) {

		return hDao.selectnList(pi);
	}
	@Override
	public int gethListCount() {
		
		return hDao.gethListCount();
	}

	@Override
	public Notice getnDetail(String noticeNum) {

		return hDao.getnDetail(noticeNum);
	}
	
	@Override
	public int updateNotice(Notice n) {
		
		return hDao.updateNotice(n);
	}

	@Override
	public ArrayList<Notice> selectHRnList(PageInfo pi) {

		return hDao.selectHRnList(pi);
	}

	@Override
	public Notice gethrnDetail(String noticeNum) {

		return hDao.gethrnDetail(noticeNum);
	}

	@Override
	public int insertNotice(Notice n) {
		
		return hDao.insertNotice(n);
	}

	@Override
	public int insertAtt(Attachment a) {

		return hDao.insertAtt(a);
	}

	@Override
	public ArrayList<Department> getDeptList() {

		return hDao.selectDeptList();
	}

	@Override
	public ArrayList<Employee> getEmp() {

		return hDao.selectEmp();
	}

	@Override
	public ArrayList<Employee> getEmpCount() {

		return hDao.getEmpCount();
	}

	
	@Override
	public ArrayList<Dept> selectModaDeptlList() {
		return hDao.selectModaDeptlList();
	}
	
	@Override
	public ArrayList<Grade> selectModalGradeList() {
		return hDao.selectModalGradeList();
	}
	
	@Override
	public ArrayList<Modal> selectModalEmpList() {
		return hDao.selectModalEmpList();
	}

	@Override
	public ArrayList<Modal> selectModalList(String[] empList) {
		return hDao.selectModalList(empList);
	}

	@Override
	public int addDept(String deptName) {
		
		return hDao.addDept(deptName);
	}

	@Override
	public int updateDept(Dept d) {

		return hDao.updateDept(d);
	}

	@Override
	public int deleteDept(int deptNum) {
		
		return hDao.deleteDept(deptNum);
	}

	@Override
	public int insertEmp(Employee e) {

		return hDao.insertEmp(e);
	}
	
	@Override
	public int setHoliday() {

		return hDao.setHoliday();
	}

	@Override
	public int getDeptNum(String deptName) {

		return hDao.getDeptNum(deptName);
	}

	@Override
	public int getGradeNum(String gradeName) {

		return hDao.getGradeNum(gradeName);
	}

	@Override
	public ArrayList<Employee> elistByName(String deptName) {

		return hDao.elistByName(deptName);
	}

	@Override
	public int updateEmp(Employee e) {
		
		return hDao.updateEmp(e);
	}
	

	public int checkHolidayCount() {
		return aDao.checkHolidayCount();
	}

	@Override
	public int updateHolidayCount() {
		return aDao.updateHolidayCount();
	}

	@Override
	public int getThisLate(String empNum) {

		return hDao.getThisLate(empNum);
	}

	@Override
	public int getnoOn(String empNum) {

		return hDao.getnoOn(empNum);
	}

	@Override
	public int getnoOff(String empNum) {
		return hDao.getnoOff(empNum);
	}

	@Override
	public ArrayList<Att> getMonthAtt(String empNum) {
			
		return hDao.getMonthAtt(empNum);
	}

	@Override
	public ArrayList<MyHoli> showMyHoliday(String empNum) {
		
		return hDao.showMyHoliday(empNum);
	}

	@Override
	public HoliCount myHoliCount(String empNum) {

		return hDao.myHoliCount(empNum);
	}

	@Override
	public ArrayList<AllHoli> allHoliday(String deptName) {
		
		return hDao.allHoliday(deptName);
	}

	@Override
	public ArrayList<UseHoli> useHolidayList(String empNum) {
		
		return hDao.useHolidayList(empNum);
	}

	

	

	
}
	
