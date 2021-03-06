package com.tob.cart;

import java.io.Serializable;

import org.springframework.stereotype.Component;
  
@Component
public class CartVO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String cartNum;
	private String cartToday;
	
	public String getCartToday() {
		return cartToday;
	}
	public String getBookId() {
		return bookId;
	}
	public void setCartToday(String cartToday) {
		this.cartToday = cartToday;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	private String bookId;
	private String userid;
	private String count;
	
	
	public String getCartNum() {
		return cartNum;
	}
	public String getBookid() {
		return bookId;
	}
	public String getUserid() {
		return userid;
	}
	public String getCount() {
		return count;
	}
	public void setCartNum(String cartNum) {
		this.cartNum = cartNum;
	}
	public void setBookid(String bookid) {
		this.bookId = bookid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setCount(String count) {
		this.count = count;
	}
	
	
}
