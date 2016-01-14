package com.tob.category;

import java.io.Serializable;

import org.springframework.stereotype.Component;
@Component
public class CategoryVO implements Serializable{
	private static final long serialVersionUID = 1L;
 
	private String categoryId;  // 고유번호
	private String categoryName; // 카테고리 이름
	
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "CategoryVO [categoryId=" + categoryId + ", categoryName=" + categoryName + "]";
	}
	
	
	
	
	
}