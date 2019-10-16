package com.wework.workman.mypage.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.hunamResource.model.vo.HumanResource;
import com.wework.workman.mypage.model.dao.MypageDao;
import com.wework.workman.mypage.model.vo.Employee;
import com.wework.workman.mypage.model.vo.Mypage;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	
	
	@Resource(name="mypageDao")
	private MypageDao mDao;


	/**
	 * 로그인
	 */
	@Override
	public Mypage loginMan(Mypage m) {
		return mDao.loginMan(m);
	}

	
}
