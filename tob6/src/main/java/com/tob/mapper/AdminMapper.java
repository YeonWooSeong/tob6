package com.tob.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tob.admin.AdminVO;
import com.tob.book.BookVO;
import com.tob.global.Command2;

@Repository
public interface AdminMapper {

	public int update(AdminVO admin);
	public int insert(AdminVO admin);
	
	public AdminVO selectById(String id); //아이디로 조회
	public AdminVO selectByEmail(String admin_email); //이메일로 조회
	
	public List<BookVO> selectAll(Command2 command);
	public int count();
	
	public int deletePurchase(String userid);
	public int deleteCart(String userid);
	
} 
