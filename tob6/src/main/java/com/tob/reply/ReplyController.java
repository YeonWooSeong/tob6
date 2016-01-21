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
import org.springframework.web.bind.annotation.ResponseBody;

import com.tob.event.CommandEventFactory;
import com.tob.global.CommandFactory;



@Controller
@RequestMapping("/reply")
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Autowired ReplyServiceImpl service;
	@Autowired ReplyVO reply;
	
	@RequestMapping("/write")
	public void write(
			Model model,
			int replySeq,
			String comment,
			String writer,
			//String regDate
			String evtId
			) {
		logger.info("시퀀스 : {}",replySeq);
		logger.info("내용 : {}", comment);
		logger.info("아이디 : {}", writer);
		//logger.info("날짜: {}", regDate);
		logger.info("이벤트아이디 : {}", evtId);
		reply.setReplySeq(replySeq);
		reply.setComment(comment);
		reply.setWriter(writer);
		reply.setEvtId(evtId);
		service.insert(reply);
		//reply.setRegDate(regDate);
		/*service.delete(reply);*/
		
	}
	@RequestMapping("/read")
	public void read(){
		
	}
	@RequestMapping("/update")
	public void update(){}
	
	@RequestMapping("/delete")
	public void delete(){}
	
	@RequestMapping("/list/{evtId}/{pageNo}")
	public @ResponseBody Map<String,Object> list(
			@PathVariable("evtId")String evtId,
			@PathVariable("pageNo")String pageNo,
			Model model
			){
		logger.info("ReplyController list() 진입");
		logger.info("넘어온 이벤트 id : {}",evtId);
		logger.info("넘어온 페이지No. : {}",pageNo);
		
		int pageNumber = Integer.parseInt(pageNo);
		int pageSize = 5;
		int groupSize = 2;
		int count = service.count();
		logger.info("번호 : {}",count);
		int totalPage = count/pageSize;
		if (count%pageSize != 0) {
			totalPage += 1;
		}
		int startPage = pageNumber - ((pageNumber-1) % groupSize);
		int lastPage = startPage + groupSize -1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", service.selectAll(CommandFactory.list(pageNo)));
		map.put("count", count);
		map.put("totalPage", totalPage);
		map.put("pageNo", pageNumber);
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		map.put("groupSize", groupSize);
		
		return map;
	}
	
	@RequestMapping("/count")
	public void count(){}
}
