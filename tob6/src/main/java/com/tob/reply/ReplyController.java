package com.tob.reply;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tob.event.CommandEventFactory;
import com.tob.global.CommandFactory;

import sun.print.resources.serviceui;



@Controller
@RequestMapping("/reply")
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Autowired ReplyServiceImpl service;
	@Autowired ReplyVO reply;
	
	@RequestMapping("/write")
	public Map<String, Object> write(
			Model model,
			String comment,
			String writer,
			String evtId
			) {
		
		logger.info("내용 : {}", comment);
		logger.info("아이디 : {}", writer);
		logger.info("이벤트아이디 : {}", evtId);
		Map<String,Object> map = new HashMap<String,Object>();
		reply.setComment(comment);
		reply.setWriter(writer);
		reply.setEvtId(evtId);
		service.insert(reply);
		map.put("list", service.selectAll());
		return map;
	}
	
	
	@RequestMapping("/read")
	public void read(){
		
	}
	@RequestMapping("/update")
	public @ResponseBody ReplyVO update(
			String comment
			){
		logger.info("리플라이 컨트롤러 업데이트 진입");
		logger.info("넘어온 내용 : "+comment);
		reply.setComment(comment);
		
		int result = service.update(reply);
		if (result == 1) {
			logger.info("변경 성공");
		} else {
			logger.info("변경 실패");
		}
		return reply;
	}
	
	@RequestMapping("/delete")
	public @ResponseBody ReplyVO delete(
			String replySeq,
			Model model
			){
		logger.info("리플라이 시퀀스는"+replySeq);
		/*service.delete(replySeq);*/
		
		/*int result = service.delete(replySeq);*/
		/*if (result == 1) {
			logger.info("리플라이 컨트롤러 리플 삭제성공");
		} else {
			logger.info("리플라이 컨트롤러 리플 삭제실패");
		}*/
		return reply;
		
	}
	
	@RequestMapping("/list/{evtId}/{pageNo}")
	public @ResponseBody Map<String,Object> list(
			@PathVariable("evtId")String evtId,
			@PathVariable("pageNo")String pageNo,
			Model model
			){
		logger.info("ReplyController list() 진입");
		logger.info("넘어온 이벤트 id : {}",evtId);
		logger.info("넘어온 페이지No. : {}",pageNo);
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", service.selectAll());
		
		return map;
	}
	
	@RequestMapping("/count")
	public void count(){}
}
