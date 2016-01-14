package com.tob.stock;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tob.mapper.GenreMapper;
import com.tob.mapper.StockMapper;

@Service
public class StockServiceImpl implements StockService {
	
	private static final Logger logger = LoggerFactory.getLogger(StockServiceImpl.class);
	@Autowired private SqlSession sqlSession;
	
	@Override
	public int registration(StockVO o) {
		StockMapper mapper = sqlSession.getMapper(StockMapper.class);
		return mapper.registration(o);
	}

	@Override
	public int delete(String stock) {
		StockMapper mapper = sqlSession.getMapper(StockMapper.class);
		return mapper.delete(stock);
	}
	
}
 