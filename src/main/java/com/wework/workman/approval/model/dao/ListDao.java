package com.wework.workman.approval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("listDao")
public class ListDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

}
