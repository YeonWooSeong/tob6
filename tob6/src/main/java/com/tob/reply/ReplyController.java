package com.tob.reply;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/reply")
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Autowired ReplyServiceImpl service;
	@Autowired ReplyVO reply;
	
	@RequestMapping("/Reply")
	public void reply(
			Model model,
			String writer,
			String comment,
			String regDate,
			String thumnail
			) {
		logger.info("아이디 : {}", writer);
		logger.info("댓글내용 : {}", comment);
		logger.info("등록일 : {}", regDate);
		logger.info("썸네일 : {}" , thumnail);
		reply.setWriter(writer);
		reply.setComment(comment);
		reply.setRegDate(regDate);
		reply.setThumnail(thumnail);
		/*ReplyService.reply()*/;
	}
	
	
}
