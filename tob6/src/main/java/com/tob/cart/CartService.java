package com.tob.cart;

import java.util.List;

public interface CartService {
	
	// 장바구니 담기
	public int put(String bookid, String userid);
	
	// 장바구니 목록 확인
	public List<BookCartVO> getList(String userid);
	
	// 당일 장바구니 목록 부르기
	public List<BookCartVO> getTodayList(String userid);
	
	// DB 책 아이디만 담기.
	public List<?> getBooksInCart(String userid);
	
	// DB 유저 아이디만 담기
	public List<?> getUseridList();
	
	// 장바구니 수량 변경
	public int changeCount(String userid, int count, String bookId);
	
	// 장바구니 삭제(책아이디)
	public int remove(String bookid);
	
	// 장바구니 비우기(유저아이디)
	public int empty(String userid);
}
