package com.tob.member;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class MemberVO implements Serializable{

	private static final long serialVersionUID = 1L;

	private String userid; // 아이디  =>hong => 'hong'
	private String password; // 비번
	private String name; // 회원이름
	private String birth; // 생년
	private String gender; // 핸드폰
	private String email; // 이메일
	private String phone; // 성별
	private String addr; // 주소
	private String profile; // 
	private String count;
	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getCartNum() {
		return cartNum;
	}

	public void setCartNum(String cartNum) {
		this.cartNum = cartNum;
	}

	public String getCartToday() {
		return cartToday;
	}

	public void setCartToday(String cartToday) {
		this.cartToday = cartToday;
	}
	private String cartNum;
	private String cartToday;
	
	public static MemberVO instance = new MemberVO();
	public static MemberVO getInstance(){
		return instance;
	}

	public MemberVO() {
	}
	
	public MemberVO(String userid, String password, String name, 
	         String birth, String phone, String email,
	         String gender, String addr, String profile) {
		  this.userid = userid;
	      this.password = password;
	      this.name = name;
	      this.birth = birth;
	      this.gender = gender;
	      this.email = email;
	      this.phone = phone;
	      this.addr = addr;
	      this.profile = profile;
	   }
	 public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getUserid() {
	      return userid;
	   }
	   public String getPassword() {
	      return password;
	   }
	   public String getName() {
	      return name;
	   }
	   public String getBirth() {
	      return birth;
	   }
	   public String getPhone() {
	      return phone;
	   }
	   public String getEmail() {
	      return email;
	   }
	   public String getGender() {
	      return gender;
	   }
	   public String getAddr() {
	      return addr;
	   }
	   public void setUserid(String userid) {
	      this.userid = userid;
	   }
	   public void setPassword(String password) {
	      this.password = password;
	   }
	   public void setName(String name) {
	      this.name = name;
	   }
	   public void setBirth(String birth) {
	      this.birth = birth;
	   }
	   public void setPhone(String phone) {
	      this.phone = phone;
	   }
	   public void setEmail(String email) {
	      this.email = email;
	   }
	   public void setGender(String gender) {
	      this.gender = gender;
	   }
	   public void setAddr(String addr) {
	      this.addr = addr;
	   }
	   @Override
	   public String toString() {
	      return " 회원 [아이디=" + userid 
	            + ", 비밀번호=" + password 
	            + ", 이름=" + name 
	            + ", 생년월일=" + birth
	            + ", 성별=" + gender 
	            + ", 이메일=" + email
	            + ", 전화번호=" + phone 
	            + ", 주소=" + addr + "]";
	   }

}

