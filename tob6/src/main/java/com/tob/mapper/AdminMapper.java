package com.tob.mapper;

import org.springframework.stereotype.Repository;

import com.tob.admin.AdminVO;

@Repository
public interface AdminMapper {

	public int update(AdminVO admin);
	public int insert(AdminVO admin);
	
	public AdminVO selectById(String id); //아이디로 조회
	public AdminVO selectByEmail(String admin_email); //이메일로 조회

} 
