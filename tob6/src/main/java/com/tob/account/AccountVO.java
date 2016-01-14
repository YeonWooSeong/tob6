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
