package com.tob.account;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tob.mapper.AccountMapper;
 


@Service
public class AccountServiceImpl implements AccountService{
	private static final Logger logger = LoggerFactory.getLogger(AccountServiceImpl.class);
	@Autowired private SqlSession sqlSession;
	
	@Override
	public int getTotal(String key) {
		logger.info("AccountServiceImpl : getTotal");
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.selectTotal(key);
	}

	@Override
	public List<String> ratio() {
		logger.info("AccountServiceImpl : ratio");
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.ratio();
	}


	
	
	

}
