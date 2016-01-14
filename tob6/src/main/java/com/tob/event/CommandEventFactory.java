package com.tob.event;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommandEventFactory {
	private static final Logger logger = LoggerFactory.getLogger(CommandEventFactory.class);
	public static CommandEvent list(String pageNo){
		logger.info("CommandEventFactory : 페이지넘버 = {}",pageNo);
		return new CommandEvent(pageNo);
	}
	public static CommandEvent search(String column, String keyword, String pageNo){
		logger.info("CommandEventFactory : 컬럼 = {}",column);
		logger.info("CommandEventFactory : 검색어 = {}",keyword);
		logger.info("CommandEventFactory : 페이지넘버 = {}",pageNo);
		return new CommandEvent(column, keyword, pageNo);
	}
	
}
