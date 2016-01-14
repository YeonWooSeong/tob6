package com.tob.admin;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component

public class AdminVO implements Serializable {
	private static final long serialVersionUID = 1L;
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	 
	private String id;
	private String password;
	private String adminEmail;
	private String confirm_num;
	
	
	
	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}


	private static AdminVO instance = new AdminVO();
	public static AdminVO getInstnace(){
		return instance;
	}

	public AdminVO() {
	}
	public AdminVO(String id,String password) {
		this.id = id;
		this.password = password;
	}
	
	public String getConfirm_num() {
		return confirm_num;
	}

	public void setConfirm_num(String confirm_num) {
		this.confirm_num = confirm_num;
	}
	
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	
	
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	

}

