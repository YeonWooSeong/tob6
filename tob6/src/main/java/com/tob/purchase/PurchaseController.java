package com.tob.purchase;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tob.member.MemberServiceImpl;
import com.tob.member.MemberVO;

  
@Controller
@SessionAttributes("user")
@RequestMapping("/purchase")
public class PurchaseController {
	private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	@Autowired PurchaseVO purchase;
	@Autowired PurchaseServiceImpl service;
	@Autowired MemberServiceImpl memberService;
	@Autowired EmailSender_Pur emailSender;
	@RequestMapping("/Purchase")
	public String main(){
		logger.info("구매 컨트롤러 - main() 진입");
		return "purchase/Purchase.jsp";
	}
	
	@RequestMapping("/list")
	public @ResponseBody List<PurchaseVO> list(){
		logger.info("구매 컨트롤러 - list() 진입");
		List<PurchaseVO> list = service.getList();
		logger.info("리스트 길이 : {}",list.size());
		return list;
	}
	
	@RequestMapping("/buy")
	public Model buy(
			String userid,
			String bookId,
			String price,
			Model model
			){
		logger.info("구매 컨트롤러 - buy() 진입");
		logger.info("넘어온 유저아이디 : {}",userid);
		logger.info("넘어온 북아이디 : {}",bookId);
		logger.info("넘어온 책 가격 : {}",price);
		int result = service.add(userid, bookId, price);
		
		return model;
	}
	@RequestMapping("/sendEmail")
	public Model sendEmail(
			HttpSession session,
			Model model
			) throws UnsupportedEncodingException, MessagingException{
		Email_Pur email = new Email_Pur(); 
		logger.info("구매 컨트롤러 - sendEmail() 진입");
		MemberVO member = (MemberVO) session.getAttribute("user");
		logger.info("로그인 된 유저의 이메일 : "+member.getEmail());
		member = memberService.searchByEmail(member.getEmail());
		logger.info("이메일로 찾은 멤버의 아이디 : "+member.getUserid());
		if (member.getEmail() == null) {
			model.addAttribute("login_check","unlogin");
		} else {
			model.addAttribute("login_check","login");
		}
		int randomNum =(int) (Math.random()*9999) + 1000;
		
		String sentence = "등록하신" + member.getEmail() + "로 구매인증 번호가가 발송되었습니다.";
		String sentence2 = "구매인증 번호는 " + randomNum + "입니다.";
		email.setReciver(member.getEmail());
		email.setSubject(sentence);
		email.setContent(sentence2);
		emailSender.sendMail(email);
		return model;
	}
	
	@RequestMapping("/remove/{purNum}")
	public String remove(
			@PathVariable("purNum")String purNum
			){
		logger.info("구매 컨트롤러 - remove() 진입");
		logger.info("넘어온 주문번호 : {}", purNum);
		int result = service.remove(purNum);
		return "삭제완료";
	}
}
