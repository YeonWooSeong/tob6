package com.tob.cart;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class CartTodayVO implements Serializable{

	private static final long serialVersionUID = 1L;
	private String cartToday;
	private String userid;
	
	public String getCartToday() {
		return cartToday;
	}
	public String getUserid() {
		return userid;
	}
	public void setCartToday(String cartToday) {
		this.cartToday = cartToday;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

}
