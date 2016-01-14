package com.tob.cart;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Component;
@Component
public class TodayCartVO implements Serializable{

	private static final long serialVersionUID = 1L;
	private String today;
	private String userid;
	
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());
		this.today = strToday;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
}
