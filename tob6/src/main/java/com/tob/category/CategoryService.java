package com.tob.category;

public interface CategoryService {
	
	// 등록
	public int registration(CategoryVO o);
	 
	// 삭제
	public int delete(String  Category);
		
	// 검색
	public CategoryVO searchByCategory(String  Category);

}
