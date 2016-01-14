package com.tob.account;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tob.admin.AdminService;
import com.tob.admin.AdminVO;
import com.tob.book.BookServiceImpl;
import com.tob.book.BookVO;
import com.tob.cart.CartServiceImpl;
import com.tob.cart.CartVO;
import com.tob.event.EventServiceImpl;
import com.tob.event.EventVO;
import com.tob.global.CommandFactory;
import com.tob.member.MemberServiceImpl;
import com.tob.member.MemberVO;
 

@Controller
@RequestMapping("/account")
public class AccountController {
private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired AdminService adminService;
	@Autowired AdminVO admin;
	@Autowired BookVO book;
	@Autowired BookServiceImpl bookService;
	@Autowired MemberVO member;
	@Autowired MemberServiceImpl memberService;
	@Autowired EventVO event;
	@Autowired EventServiceImpl eventService;
	@Autowired CartVO cart;
	@Autowired CartServiceImpl cartService;
	@Autowired AccountVO account;
	@Autowired AccountServiceImpl accountService;
	

	
	
	@RequestMapping("/chart_line")
	public void lineChart(
			String key,
			Model model
			) {
		logger.info("라인차트 진입");

		String year = key.substring(0,4);
		String month = key.substring(4,6);
		String day = key.substring(6,8);
		logger.info(year);
		logger.info(day);
		model.addAttribute("sum", accountService.getTotal(key));
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
	}
	
	@RequestMapping("/test")
	public String test() {
		logger.info("test 진입");
		return "admin/admin/test.tiles";
	}
	
	@RequestMapping("/ratio")
	public Model ratio(
			Model model
			) {
		
		int adult = 0;
		int cartoon = 0;
		int child = 0;
		
		logger.info("파이차트 진입");
		List<String> list = accountService.ratio();
		logger.info("리스트 사이즈 {}",list.size());
		for (int i = 0; i < list.size(); i++) {
			
			if (list.get(i)!=null) {
				
				switch (list.get(i)) {
				case "adult": adult++; ;break;
				case "cartoon": cartoon++; break;
				case "child": child++; break;
				default: break;	
			}
		}
		}
		logger.info("adult: {}", adult);
		logger.info("cartoon: {}", cartoon);
		logger.info("child: {}", child);
		
		model.addAttribute("adult", adult);
		model.addAttribute("cartoon", cartoon);
		model.addAttribute("child", child);
		return model;
	}
	
}
