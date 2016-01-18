package com.tob.reply;

import java.util.HashMap;
import java.util.Map;

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
			String replySeq,
			String comment,
			String writer,
			String regDate,
			String thumnail
			) {
		logger.info("리플라이시퀀스 : {}",replySeq);
		logger.info("내용 : {}", comment);
		logger.info("아이디 : {}", writer);
		logger.info("날짜: {}", regDate);
		logger.info("이미지: {}", thumnail);
		reply.setReplySeq(Integer.parseInt(replySeq));
		reply.setComment(comment);
		reply.setWriter(writer);
		reply.setRegDate(regDate);
		reply.setThumnail(thumnail);
		/*service.delete(reply);*/
		
	}
	@RequestMapping("/remove_reply")
	public void removeReply(
			Model model,
			String code, String reply) {
		/*ReplyService.delete(Integer.parseInt(reply));*/
		
	}
	@RequestMapping("/read")
	public void read(
			Model model,
			String code,
			String myself
			) {
		logger.info("read() 진입");
		/*reply = service.selectById(Integer.parseInt(code));*/
		// 자기자신은 조회수를 증가시키면 안됨
		if(myself.equals("false")){
			Map<String, Integer> data = new HashMap<String, Integer>();

	}
		
		model.addAttribute("reply", reply);
	}
	
}
