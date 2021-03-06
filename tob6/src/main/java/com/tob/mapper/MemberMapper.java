package com.tob.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tob.cart.BookCartVO;
import com.tob.cart.CartVO;
import com.tob.global.Command;
import com.tob.global.Command2;
import com.tob.member.MemberVO;

@Repository
public interface MemberMapper {
	
		public String joinForm();
	    public String loginForm();
	    public String mypageForm();
	    public int join(MemberVO member);
		public MemberVO logout(String userid, String password); 
		public int insert(MemberVO member);
		public MemberVO searchById(String userid);
		public int change(MemberVO member);
		public int count();  
		public int countByKeyword(Command command); 
		public int update(MemberVO member);
		public List<MemberVO> selectSomeBy(String domain, String searchword);
		public List<MemberVO> selectAll(Command2 command);
		public int changePwd(MemberVO member);
		public MemberVO selectOneBy(String userid);
		/*public List<CartVO> getList(CartVO cart);*/
		public MemberVO detail(String userid);
		public int remove(String userid);
}