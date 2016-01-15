package com.tob.admin;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tob.mapper.AdminMapper;
import com.tob.mapper.BookMapper;
import com.tob.account.AccountController;
import com.tob.book.BookVO;
import com.tob.global.Command2;

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

	@Override
	public List<BookVO> selectAll(Command2 command) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectAll(command);
	}
	
	public int count() {
		logger.info("AdminServiceImpl : count");
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.count();
	}

	@Override
	public int deletePurchase(String userid) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.deletePurchase(userid);
	}

	@Override
	public int deleteCart(String userid) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.deleteCart(userid);
	}

	
}
