package com.tob.genre;

import java.io.Serializable;

import org.springframework.stereotype.Component;
@Component
public class GenreVO implements Serializable{
	private static final long serialVersionUID = 1L;

	private String genreId;  //장르 고유번호
	private String genreName; //장르
	private String categoryId; // 카테고리 id
	 
	
	
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getGenreId() {
		return genreId;
	}
	public void setGenreId(String genreId) {
		this.genreId = genreId;
	}
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "GenreVO [genreId=" + genreId + ", genreName=" + genreName + ", categoryId=" + categoryId + "]";
	}
	
	
	
	
	
	
}