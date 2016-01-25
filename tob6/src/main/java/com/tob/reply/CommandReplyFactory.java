package com.tob.reply;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommandReplyFactory {
	private static final Logger logger = LoggerFactory.getLogger(CommandReplyFactory.class);
	public static CommandReply list(String pageNo){
		logger.info("CommandFactory : 페이지넘버 = {}",pageNo);
		return new CommandReply(pageNo);
	}
	public static CommandReply search(String column, String keyword, String pageNo){
		logger.info("CommandFactory : 컬럼 = {}",column);
		logger.info("CommandFactory : 검색어 = {}",keyword);
		logger.info("CommandFactory : 페이지넘버 = {}",pageNo);
		return new CommandReply(column, keyword, pageNo);
	}
	public static CommandReply boardList(String pageNo, String themeNo){
		logger.info("CommandFactory : 페이지넘버 = {}",pageNo);
		logger.info("CommandFactory : 테마넘버 = {}",themeNo);
		return new CommandReply(pageNo, themeNo);
	}
}
