package com.tob.option2;

public interface Option2Service {
	
	//등록
	public int registration( Option2VO o);
	
	//삭제
	public int delete(String  Option2);
		
	//검색
	public  Option2VO searchByOption2(String  Option2);

	
}
 