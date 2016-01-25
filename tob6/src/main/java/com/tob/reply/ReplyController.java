package com.tob.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.tob.member.MemberVO;

import sun.print.resources.serviceui;



@Controller
@RequestMapping("/reply")
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Autowired ReplyServiceImpl service;
	@Autowired ReplyVO reply;
	@Autowired MemberVO member;
	
	@RequestMapping("/write")
	public Model write(
			Model model,
			String comment,
			String writer,
			String evtId
			){
		
		logger.info("내용 : {}", comment);
		logger.info("아이디 : {}", writer);
		logger.info("이벤트아이디 : {}", evtId);
		List<String> list = service.getList(evtId);
		String temp = null;
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list 목록"+list.get(i));
			if (list.get(i).equals(writer)) {
				temp = writer;
			}
		}
		if (temp != null ) {
			String msg = "이미 글을 씀";
			model.addAttribute("msg", msg);
			return model;
		}else{
			Map<String,Object> map = new HashMap<String,Object>();
			reply.setComment(comment);
			reply.setWriter(writer);
			reply.setEvtId(evtId);
			int result = service.insert(reply);
			//map.put("list", service.selectAll());
			model.addAttribute("list", service.selectAll());
			return model;
		}
		
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
	public @ResponseBody Map delete(
			String replySeq,
			String evtId,
			String writer,
			String userid){
		logger.info("리플라이 시퀀스는"+replySeq);
	     int seq = Integer.parseInt(replySeq);
		
	     Map<String,Object> map = new HashMap<String,Object>();
		int result = service.delete(seq);
		if (result == 1) {
		logger.info("리플라이 컨트롤러 리플 삭제성공");
		
		map.put("list", service.selectAll());
	} else {
		logger.info("리플라이 컨트롤러 리플 삭제실패");
		map.put("result", 0);
	}
		return map;
		
	}
	
	@RequestMapping("/list/{userid}/{evtId}/{pageNo}")
	public @ResponseBody Map<String,Object> list(
			@PathVariable("userid")String userid,
			@PathVariable("evtId")String evtId,
			Model model
			){
		logger.info("ReplyController list() 진입");
		logger.info("넘어온  userid : {}",userid);
		logger.info("넘어온 이벤트 id : {}",evtId);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", service.selectAll());
		
		return map;
	}
	
	@RequestMapping("/count")
	public void count(){}
}
