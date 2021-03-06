package com.wework.workman.account.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.wework.workman.account.model.dao.AccountDao;
import com.wework.workman.account.model.vo.AcNotice;
import com.wework.workman.account.model.vo.AccountStatus;
import com.wework.workman.account.model.vo.Attendance2;
import com.wework.workman.account.model.vo.AvgSalary;
import com.wework.workman.account.model.vo.Fixture;
import com.wework.workman.account.model.vo.ForGraph;
import com.wework.workman.account.model.vo.IncomeStatement;
import com.wework.workman.account.model.vo.IsState;
import com.wework.workman.account.model.vo.NoticeFile;
import com.wework.workman.account.model.vo.OsManage;
import com.wework.workman.account.model.vo.Partner;
import com.wework.workman.account.model.vo.Product;
import com.wework.workman.account.model.vo.SalaryManage;
import com.wework.workman.account.model.vo.SaleManage;
import com.wework.workman.common.PageInfo;

@Service("accountService")
public class AccountServiceImpl implements AccountService{
	@Resource(name="accountDao")
	private AccountDao aDao;
	@Autowired
	private DataSourceTransactionManager transactionManager; 
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public int getNoticeListCount() {
		return aDao.getNoticeListCount();
	}

	@Override
	public ArrayList<AcNotice> noticeList( PageInfo pi) {
		return aDao.noticeList(pi);
	}

	@Override
	public AcNotice noticeDetail(String aNo) {
		return aDao.noticeDetail(aNo);
	}

	@Override
	public int aNoticeInsert(AcNotice acNotice) {
		return aDao.aNoticeInsert(acNotice);
	}

	@Override
	public int checkNotice(String noticeTitle) {
		return aDao.checkNotice(noticeTitle);
	}

	@Override
	public ArrayList<AccountStatus> accountStatus(String noticeContent) {
		return aDao.accountStatus(noticeContent);
	}

	@Override
	public ArrayList<IncomeStatement> incomeStatus(IsState iss) {		
		return aDao.incomeStatus(iss);
	}


	@Override
	public int getSaleListCount() {
		return aDao.getSaleListCount();
	}

	@Override
	public ArrayList<SaleManage> saleList( PageInfo pi) {
		return aDao.saleList(pi);
	}

	@Override
	public int insertSale(SaleManage sm) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			sqlSession.getConnection().setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int result1 =aDao.insertSaleAccount(sm);
		int result2=aDao.insertSale(sm);
		if (result1>0&&result2>0) {
			transactionManager.commit(status);
			result1=1;
		}else {
			transactionManager.rollback(status);
			result1=0;
		}
		return result1;
	}

	@Override
	public int getOSListCount() {
		return aDao.OSListCount();
	}

	@Override
	public ArrayList<OsManage> osList( PageInfo pi) {
		return aDao.osList(pi);
	}

	@Override
	public int getFixtureListCount() {
		return aDao.getFixtureListCount();
	}

	@Override
	public ArrayList<Fixture> fixtureList( PageInfo pi) {
		return aDao.fixtureList(pi);
	}

	@Override
	public int getSalaryListCount() {
		return aDao.getSalaryListCount();
	}

	@Override
	public ArrayList<SalaryManage> salaryList(PageInfo pi) {
		ArrayList<SalaryManage> list = aDao.salaryList(pi);
		ArrayList<String> li = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			String eNum =list.get(i).getEmpNum();
			int a =aDao.getIncreaseRate(eNum);
			double b;
			if(a==0) {
				b=0;
			}else {
				b = Math.round((list.get(i).getYearSalary()- a)/(double)a);
			}
			
			list.get(i).setIncreaseRate(b);
		}
		return list;
	}

	@Override
	public ArrayList<SalaryManage> salaryDetail(String empNum) {
		return aDao.salaryDetail(empNum);
	}

	@Override
	public int checkSalary() {
		return aDao.checkSalary();
	}

	@Override
	public ArrayList<Partner> getPartner(String partnerNum) {
		return aDao.getPartner(partnerNum);
	}

	@Override
	public ArrayList<Product> getProduct(String productCode) {
		return aDao.getProduct(productCode);
	}

	@Override
	public int validCheck(String noticeTitle) {
		return aDao.validCheck(noticeTitle);
	}

	@Override
	public int insertIncome(IsState iss) {
		// 트랜잭션 에 대한 기본 세팅을 위한 객체
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			sqlSession.getConnection().setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//트랜잭션 상태 관리하는 객체
		
		int r1 = aDao.insertIncome1(iss);
		int r2= aDao.insertIncome2(iss);
		int r3= aDao.insertIncome3(iss);
		int r4= aDao.insertIncome4(iss);
		int r5= aDao.insertIncome5(iss);
		int r6= aDao.insertIncome6(iss);
		int r7= aDao.insertIncome7(iss);
		int r8= aDao.insertIncome8(iss);
		int r9= aDao.insertIncome9(iss);
		int result=0;
		if (r1>0&&r2>0&&r3>0&&r4>0&&r5>0&&r6>0&&r7>0&&r8>0&&r9>0) {
			result=1;
			transactionManager.commit(status);
		}
		else {
			transactionManager.rollback(status);
		}
		return result;
		
		
	}

	@Override
	public ArrayList<Product> productList() {
		return aDao.productList();
	}

	@Override
	public ArrayList<Partner> partnerList() {
		return aDao.partnerList();
	}

	@Override
	public AvgSalary avgSalary(SalaryManage salaryManage) {
		return aDao.avgSalary(salaryManage);
	}

	@Override
	public int checkSal() {
		return aDao.checkSal();
	}

	@Override
	public int insertSal() {
		return aDao.insertSal();
	}

	@Override
	public int checkYearSal() {
		return aDao.checkYearSal();
	}

	@Override
	public int insertYearSalary() {
		return aDao.insertYearSalary();
	}

	@Override
	public int insertFile(NoticeFile nf) {
		return aDao.insertFile(nf);
	}

	@Override
	public NoticeFile noticeFile(String acDetail) {
		return aDao.noticeFile(acDetail);
	}

	@Override
	public int updateYearSalary(SalaryManage sm) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			sqlSession.getConnection().setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int r1=aDao.updateEmpSalary(sm);
		int r2=aDao.updateYearSalary(sm);
		
		int result=0;
		if(r1>0&& r2>0) {
			transactionManager.commit(status);
			result=1;
		}else {
			transactionManager.rollback(status);
		}
		return result;
	}

	@Override
	public int checkAtten(Attendance2 a) {
		return aDao.checkAtten(a);
	}

	@Override
	public int goWork(Attendance2 a) {
		return aDao.goWork(a);
	}

	@Override
	public int outWork(Attendance2 a) {
		return aDao.outWork(a);
	}

	@Override
	public ForGraph getGraph(ForGraph grap) {
		return aDao.getGraph(grap);
	}
	@Override
	public Partner selectPartner(String partnerNum) {
		return aDao.selectPartner(partnerNum);
	}

	@Override
	public ArrayList<Fixture> deptFixInfo() {
		return aDao.deptFixInfo();
	}

	@Override
	public ArrayList<AcNotice> deptEmpInfo(int deptNum) {
		return aDao.deptEmpInfo(deptNum);
	}

	@Override
	public int insertFixture(Fixture f) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			sqlSession.getConnection().setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int result =0;
		int r1= aDao.insertFixture1(f);
		int r2= aDao.insertFixture2(f);
		int r3= aDao.insertFixture3(f);
		if(r1>0&&r2>0&&r3>0) {
			transactionManager.commit(status);
			result=1;
		}else {
			transactionManager.rollback(status);
		}
		return result;
	}

	@Override
	public int insertOs(OsManage o) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			sqlSession.getConnection().setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int result =0;
		int r1 = aDao.insertOs1(o);
		int r2 = aDao.insertOs2(o);
		int r3 = aDao.insertOs3(o);
		if (r1>0&&r2>0&&r3>0) {
			transactionManager.commit(status);
			result=1;
		}else {
			transactionManager.rollback(status);
		}
		return result;
	}

	@Override
	public int deleteEmp(String empNum) {
		return aDao.deleteEmp(empNum);
	}

	
}
