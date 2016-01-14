package com.tob.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tob.global.Command;
import com.tob.mapper.BookMapper;
 

@Service
public class BookServiceImpl implements BookService{
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	@Autowired private SqlSession sqlSession;

@Override /*책 등록*/
public int registration(BookVO o) {
	BookMapper mapper = sqlSession.getMapper(BookMapper.class);
	return mapper.registration(o);
}






@Override /*책 삭제*/
public int delete(String book) {
	BookMapper mapper = sqlSession.getMapper(BookMapper.class);
	return mapper.delete(book);
}



@Override  //책 검색 (책 id값으로)
public BookVO searchByBook(String book) {
	BookMapper mapper = sqlSession.getMapper(BookMapper.class);
	return mapper.searchByBook(book);
}



@Override  	// 전체 책 목록
public List<BookVO> selectAll(Command command) {
	BookMapper mapper = sqlSession.getMapper(BookMapper.class);
	return mapper.selectAll(command);
}





@Override  //정보 수정
public int change(BookVO book) {
	BookMapper mapper = sqlSession.getMapper(BookMapper.class);
	return mapper.update(book);
}



public int count() {
	logger.info("BookServiceImpl : count");
	BookMapper mapper = sqlSession.getMapper(BookMapper.class);
	return mapper.count();
}



@Override
public List<BookVO> searchByBookName(Command command) {
	BookMapper mapper = sqlSession.getMapper(BookMapper.class);
	return mapper.searchByBookName(command);
}





}
