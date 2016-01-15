package com.tob.account;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component 
public class AccountVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String account_num;
	private int total;
	private String id;
	private String start;
	private String end;
	
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

	
}
