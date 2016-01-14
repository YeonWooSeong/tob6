package com.tob.category;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tob.mapper.CategoryMapper;
import com.tob.mapper.GenreMapper;

@Service
public class CategoryServiceImpl implements CategoryService{
	private static final Logger logger = LoggerFactory.getLogger(CategoryServiceImpl.class);
	@Autowired private SqlSession sqlSession;
	 
	@Override
	public int registration(CategoryVO o) {
		CategoryMapper mapper = sqlSession.getMapper(CategoryMapper.class);
		return mapper.registration(o);
	}

	@Override
	public int delete(String Category) {
		CategoryMapper mapper = sqlSession.getMapper(CategoryMapper.class);
		return mapper.delete(Category);
	}

	@Override
	public CategoryVO searchByCategory(String Category) {
		CategoryMapper mapper = sqlSession.getMapper(CategoryMapper.class);
		return mapper.searchByCategory(Category);
	}

}
