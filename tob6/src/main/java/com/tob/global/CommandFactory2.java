package com.tob.global;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommandFactory2 {
	private static final Logger logger = LoggerFactory.getLogger(GlobalController.class);
	public static Command2 list(String pageNo){
		logger.info("CommandFactory : 페이지넘버 = {}",pageNo);
		return new Command2(pageNo);
	}
	public static Command2 search(String column, String keyword, String pageNo){
		logger.info("CommandFactory : 컬럼 = {}",column);
		logger.info("CommandFactory : 검색어 = {}",keyword);
		logger.info("CommandFactory : 페이지넘버 = {}",pageNo);
		return new Command2(column, keyword, pageNo);
	}
	public static Command2 boardList(String pageNo, String themeNo){
		logger.info("CommandFactory : 페이지넘버 = {}",pageNo);
		logger.info("CommandFactory : 테마넘버 = {}",themeNo);
		return new Command2(pageNo, themeNo);
	}
}
