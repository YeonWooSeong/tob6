package com.tob.option2;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tob.mapper.Option2Mapper;


@Service
public class Option2ServiceImpl implements Option2Service{
	
	private static final Logger logger = LoggerFactory.getLogger(Option2ServiceImpl.class);
	@Autowired private SqlSession sqlSession;
	
	
	@Override
	public int registration(Option2VO o) {
		Option2Mapper mapper = sqlSession.getMapper(Option2Mapper.class);
		return mapper.registration(o);
	}
	@Override
	public int delete(String Option2) {
		Option2Mapper mapper = sqlSession.getMapper(Option2Mapper.class);
		return mapper.delete(Option2);
	}
	@Override
	public Option2VO searchByOption2(String Option2) {
		Option2Mapper mapper = sqlSession.getMapper(Option2Mapper.class);
		return mapper.searchByOption2(Option2);
	}
	
	
}
 