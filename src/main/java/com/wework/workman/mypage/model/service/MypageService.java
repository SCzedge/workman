package com.wework.workman.mypage.model.service;

import com.wework.workman.mypage.model.vo.Mypage;

public interface MypageService {

	// 로그인 메소드
	Mypage loginMan(Mypage m);

	// 정보 수정
	int empUpdate(Mypage m);
	
	// 비번 수정
	int pwdUpdate(Mypage m);

	// 비번 찾기
	Mypage findPwd(Mypage m);

}
