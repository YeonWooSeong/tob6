package com.tob.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tob.global.CommandFactory;


@Controller
@RequestMapping("/book")
public class BookController {
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Autowired BookServiceImpl service;
	@Autowired BookVO book;
	
	// 전체 책 종류 보여주기 0.
	@RequestMapping("/Book")
	public String book(){
		logger.info("BookController:Book()");
		return "book/Book.part";
				
	}
	//-------------- 이게 마지막 수정 소스 ----------------------
	@RequestMapping("/Book_selectAll2/{pageNo}/{genreId}")
	public @ResponseBody Map<String,Object>bookAll2(
@PathVariable("pageNo")String pageNo,
@PathVariable("genreId")String genreId,
			HttpSession session,
			Model model
			){
		logger.info("BookController selectAll2()진입.");
		logger.info("넘어온 페이지No.2 : {}",pageNo);
		logger.info("넘어온 장르아이디 (잘 넘어왔음): {}",genreId);
		
		int pageNumber = Integer.parseInt(pageNo);
		int pageSize = 3;
		int groupSize = 3;
		int count = service.count();
		logger.info("번호2 : {}",count);
		int totalPage = count/pageSize;
		if (count%pageSize != 0) {
			totalPage += 1;
		}
		int startPage = pageNumber - ((pageNumber-1) % groupSize);
		int lastPage = startPage + groupSize -1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", service.selectAll(CommandFactory.search("GENRE_ID", genreId, pageNo)));
		map.put("count", count);
		map.put("totalPage", totalPage);
		map.put("pageNo", pageNumber);
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		map.put("groupSize", groupSize);
		logger.info("BookController:Book_selectAll2()");
		logger.info("커맨드를 거친  genreId는 ??: ", genreId);
		logger.info("커맨드를 거친  Page는 ??: ", pageNo);
		
				return map;
				}
	
	
	
	
	//전체 책 목록  보여주기 1.(배열 내리기) => 로그인 안했을 때. @@@@@@@@@@@@@@@
	@RequestMapping("/Book_selectAll/{pageNo}")
	public @ResponseBody Map<String,Object> bookAll(
			@PathVariable("pageNo")String pageNo,
			
			HttpSession session,
			Model model
			){
		logger.info("BookController selectAll()진입.");
		logger.info("넘어온 페이지No. : {}",pageNo);
		
		int pageNumber = Integer.parseInt(pageNo);
		int pageSize = 3;
		int groupSize = 3;
		int count = service.count();
		logger.info("번호 : {}",count);
		int totalPage = count/pageSize;
		if (count%pageSize != 0) {
			totalPage += 1;
		}
		int startPage = pageNumber - ((pageNumber-1) % groupSize);
		int lastPage = startPage + groupSize -1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", service.selectAll(CommandFactory.list(pageNo)));
		map.put("count", count);
		map.put("totalPage", totalPage);
		map.put("pageNo", pageNumber);
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		map.put("groupSize", groupSize);
		logger.info("BookController:Book_selectAll()");
		return map;
	}
	
	// 책 상세 정보 보여주기 2.
	@RequestMapping("/Book_main/{bookId}")
public @ResponseBody BookVO bookMain(
		@PathVariable("bookId")String id 
		
		){
	logger.info("BookController:bookId()");
	logger.info("책 고유번호 : {}",id);
	book = service.searchByBook(id);
	logger.info("책 이름 : {}",book.getBookName());
	return book;
} 
	//-------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	
	// 책 이름으로 '검색' 기능 구현하기
	@RequestMapping("/Book_find/{pageNo}/{bookName}")
public @ResponseBody Map<String,Object> searchByBookName(
		@PathVariable("pageNo")String pageNo,
		@PathVariable("bookName")String bookName,
		Model model
		){
		
		logger.info("===============Integer.parseInt(pageNo)전  검색된 번호 :{}",pageNo);
		logger.info("===============bookName:{}",bookName);
		int pageNumber = Integer.parseInt(pageNo);
		int pageSize = 3;
		int groupSize = 3; //밑에 보여주는 번호.
		int count = service.count();
		logger.info(" Book_find  번호 : {}",count);
		int totalPage = count/pageSize;
		if (count%pageSize != 0) {
			totalPage += 1;
		}
		int startPage = pageNumber - ((pageNumber-1) % groupSize);
		int lastPage = startPage + groupSize -1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list", service.searchByBookName(CommandFactory.search("BOOK_NAME",bookName,pageNo)));
		map.put("count", count);
		map.put("totalPage", totalPage);
		map.put("pageNo", pageNumber);
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		map.put("groupSize", groupSize);
		map.put("bookName2", bookName);
		logger.info("BookController:Book_find() 검색된 책 이름  :{}",bookName);
		logger.info("BookController:Book_find() 페이지 번호 :{}",pageNo);
		return map;
}
	
}
