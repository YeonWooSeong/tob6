package com.tob.event;

import com.tob.global.Orderable;

public class CommandEvent implements Orderable{
	private String column, keyword; 
	private int pageNO, start, end, themeNo;
	
	public final int PAGESIZE = 8;
	
	public CommandEvent(String pageNo) {
		this.pageNO = Integer.parseInt(pageNo);
		this.start = (Integer.parseInt(pageNo) - 1)*PAGESIZE+1;
		this.end = (Integer.parseInt(pageNo)*PAGESIZE);
	} //페이지 넘버만 넘어왓을때.
	
	public CommandEvent(String column, String keyword, String pageNo) {
		this.column = column;
		this.keyword = keyword;
		this.pageNO = Integer.parseInt(pageNo);
		this.start = (Integer.parseInt(pageNo) - 1)*PAGESIZE+1;
		this.end = (Integer.parseInt(pageNo)*PAGESIZE);
	} //검색어도 같이 넘어왔을 때
	
	
	
	
	public int getPageNO() {
		return pageNO;
	}

	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}
	
	public int getThemeNo() {
		return themeNo;
	}

	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}

	public void setPageNO(int pageNO) {
		this.pageNO = pageNO;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getColumn() {
		return column;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setColumn(String column) {
		this.column = column;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public void execute() {
		// TODO Auto-generated method stub
		
	}
	
}
