package com.tob.option2;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Option2VO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String Option2Id;  // 고유번호
	private String Option2Name; //
	
	
	public String getOption2Id() {
		return Option2Id;
	}
	public void setOption2Id(String option2Id) {
		Option2Id = option2Id;
	}
	public String getOption2Name() {
		return Option2Name;
	}
	public void setOption2Name(String option2Name) {
		Option2Name = option2Name;
	}
	@Override
	public String toString() {
		return "Option2VO [Option2Id=" + Option2Id + ", Option2Name=" + Option2Name + "]";
	}
	
	
	 
}
