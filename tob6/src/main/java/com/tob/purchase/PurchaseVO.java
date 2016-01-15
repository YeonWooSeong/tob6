package com.tob.purchase;

import org.springframework.stereotype.Component;
  
@Component
public class PurchaseVO {
	private String purNum;
	private int sum;
	public String accNum;
	private String userid;
	
	public String getAccNum() {
		return accNum;
	}
	public void setAccNum(String accNum) {
		this.accNum = accNum;
	}
	private String bookid;
	
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public String getPurNum() {
		return purNum;
	}
	public int getSum() {
		return sum;
	}
	public String getUserid() {
		return userid;
	}
	public void setPurNum(String purNum) {
		this.purNum = purNum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
}
