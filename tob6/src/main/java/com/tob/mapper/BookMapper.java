package com.tob.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tob.book.BookVO;
import com.tob.global.Command;
@Repository
public interface BookMapper {

	public int registration(BookVO o);
	public int delete(String bookid); 
	public BookVO searchByBook(String userid);
	public int update(BookVO book);
	public List<BookVO> selectAll(Command command);
	public int count();
	public List<BookVO> searchByBookName(Command command);

}
