package com.tob.admin;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tob.mapper.AdminMapper;
import com.tob.account.AccountController;

@Service

public class AdminServiceImpl implements AdminService{

	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

	@Autowired private SqlSession sqlSession;
	 
	
	@Override
	public int insert(AdminVO admin) {
		logger.info("AdminServiceImpl : insert");
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.insert(admin);
	}
	
	@Override
	public int change(AdminVO admin) {
		logger.info("AdminServiceImpl : change");
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.update(admin);
	}

	@Override
	public AdminVO selectById(String id) {
		logger.info("AdminServiceImpl : selectById");
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		AdminVO member = mapper.selectById(id); //실제로 mapper에 담겨있는 sql문을 실행시켜 주는 부분
		logger.info("selectById는?"+member);
		return mapper.selectById(id);
	}

	@Override
	public AdminVO selectByEmail(String admin_email) {
		logger.info("AdminServiceImpl : selectByEmail");
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectByEmail(admin_email);
	}

	

	
}
