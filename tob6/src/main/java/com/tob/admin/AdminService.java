package com.tob.admin;

public interface AdminService {

	public int insert(AdminVO admin);
	public int change(AdminVO admin);

	public AdminVO selectById(String id);
	public AdminVO selectByEmail(String admin_email);
  	
	

}
 