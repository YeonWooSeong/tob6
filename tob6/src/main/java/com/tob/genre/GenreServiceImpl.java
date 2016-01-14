package com.tob.genre;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tob.mapper.GenreMapper;

@Service
public class GenreServiceImpl implements GenreService {
	
	private static final Logger logger = LoggerFactory.getLogger(GenreServiceImpl.class);
	@Autowired private SqlSession sqlSession;
	 
	
	@Override  //장르 등록
	public int registration(GenreVO o) {
		GenreMapper mapper = sqlSession.getMapper(GenreMapper.class);
		return mapper.registration(o);
	}

	@Override  //장르 삭제
	public int delete(String genre) {
		GenreMapper mapper = sqlSession.getMapper(GenreMapper.class);
		return mapper.delete(genre);
	}

	@Override  //장르 검색
	public GenreVO searchByGenre(String genre) {
		GenreMapper mapper = sqlSession.getMapper(GenreMapper.class);
		return mapper.searchByGenre(genre);
	}

	@Override //장르검색 카테고리
	public GenreVO searchByGenre1(String cate) {
		GenreMapper mapper = sqlSession.getMapper(GenreMapper.class);
		return mapper.searchByGenre(cate);
	}

	public List<GenreVO> selectAll() {
		GenreMapper mapper = sqlSession.getMapper(GenreMapper.class);
		return mapper.selectAll();
	}
	
	
}
