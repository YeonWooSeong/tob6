package com.tob.member;

import java.util.List;

import com.tob.cart.BookCartVO;
import com.tob.global.Command;


public interface MemberService {
	 
	   public String joinForm();
	   public String loginForm();
	   public String mypageForm();
	   public int insert(MemberVO member);
	   public int change(MemberVO member);
	   public MemberVO selectOneBy(String userid);
	   public MemberVO logout(String userid, String password);
	   public int count();
	   public MemberVO searchById(String userid);
	   
	   public MemberVO searchByEmail(String email);
	   
	   public List<MemberVO> searchBySearchword(String domain,String searchword);
	   public List<MemberVO> getList(Command command);
	   public int changePwd(MemberVO member);
	   public int remove(String userid);
	   public List<BookCartVO> getList(String userid);
	}