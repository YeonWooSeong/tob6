package com.tob.admin;

import java.util.List;

import com.tob.book.BookVO;
import com.tob.global.Command;
import com.tob.global.Command2;

public interface AdminService {

	public int insert(AdminVO admin);
	public int change(AdminVO admin);

	public AdminVO selectById(String id);
	public AdminVO selectByEmail(String admin_email);
  	
	public List<BookVO> selectAll(Command2 command);
	public int count();
	
	public int deletePurchase(String userid);
	public int deleteCart(String userid);

}
 