package com.tob.purchase;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tob.cart.BookCartVO;
import com.tob.cart.CartServiceImpl;
import com.tob.member.MemberServiceImpl;
import com.tob.member.MemberVO;

  
@Controller
@SessionAttributes("user")
@RequestMapping("/purchase")
public class PurchaseController {
	private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	@Autowired PurchaseVO purchase;
	@Autowired PurchaseServiceImpl service;
	@Autowired CartServiceImpl cartService;
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
			String userid,
			HttpSession session,
			Model model
			) throws UnsupportedEncodingException, MessagingException{
		Email_Pur email = new Email_Pur();
		String SOURCE_HTML = "<html><head><title>Jsoup Example</title></head>"
	            + "<body><h1>Welcome to JournalDev!!</h1><br />"
	            + "<div id=\"id1\">Hello</div>"
	            + "<div class=\"class1\">Pankaj</div>"
	            + "<a href=\"http://journaldev.com\">Home</a>"
	            + "<a href=\"http://wikipedia.org\">Wikipedia</a>"
	            + "</body></html>";
		 Document doc = Jsoup.parse(SOURCE_HTML);
		 System.out.println("Title="+doc.title());
         
	        //let's add attribute rel="nofollow" to all the links
	        doc.select("a[href]").attr("rel", "nofollow");
	        //System.out.println(doc.html());
	         
	        //change div class="class1" to class2
	        doc.select("div.class1").attr("class", "class2");
	        //System.out.println(doc.html());
	         
	        //change the HTML value of first h1 element
	        doc.select("h1").first().html("Welcome to JournalDev.com");
	        doc.select("h1").first().append("!!");
	        //System.out.println(doc.html());
	         
	        //let's make Home link bold
	        doc.select("a[href]").first().html("<strong>Home</strong>");
	        System.out.println(doc.html());
		
		
		
		logger.info("구매 컨트롤러 - sendEmail() 진입");
		logger.info("넘어온 유저아이디 : " + userid);
		
		if (session.getAttribute("user") == null) {
			model.addAttribute("login_check","unlogin");
		} else {
			MemberVO member = (MemberVO) session.getAttribute("user");
			logger.info("로그인 된 유저의 이메일 : "+member.getEmail());
			member = memberService.searchById(member.getUserid());
			logger.info("이메일로 찾은 멤버의 아이디 : "+member.getUserid());
			model.addAttribute("login_check","login");
			
			int randomNum =(int) (Math.random()*9999) + 1000;
			List<BookCartVO> list = cartService.getTodayList(userid);
			logger.info(list.toString());
			String sentence = "TOB 홈페이지 구매내역";
			String sentence2 = userid +" 님의 구매내역 \n" + "책 이름 \t 책 가격 \t 수량 \n";
			
			
			for (int i = 0; i < list.size(); i++) {
				String todaybookId = list.get(i).getBookId();
				String todaybookName = list.get(i).getBookName();
				int todayPrice = list.get(i).getBookPrice();
				int todaycount = list.get(i).getCount();
				
				sentence2 += todaybookId + "\t" + todaybookName + "\t" + todayPrice + "\t" + todaycount + "\n";
			}
			sentence2 += doc.html();
			//String sentence = "등록하신" + member.getEmail() + "로 구매인증 번호가가 발송되었습니다.";
			
			//String sentence2 = userid + " 님의 구매내역 \n 책 이름 : " + list.get(0).getBookName() 
			//		+ "\n 책 가격 : " + list.get(0).getBookPrice() + "\n 수량 : " + list.get(0).getCount() + " \n 결제완료 되었습니다.";
			
			email.setReciver(member.getEmail());
			email.setSubject(sentence);
			email.setContent(sentence2);
			emailSender.sendMail(email);
		}
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
