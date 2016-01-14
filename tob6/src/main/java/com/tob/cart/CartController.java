package com.tob.cart;

import java.util.List;

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

import com.tob.member.MemberVO;



@Controller
@SessionAttributes("user")
@RequestMapping("/cart")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	@Autowired CartVO cart;
	@Autowired CartServiceImpl service;
	List<?> BooksInCart;
	@RequestMapping("/Cart")
	public String main(){
		logger.info("카트 컨트롤러 - main() 진입");
		return "cart/Cart.part";
	}
	
	@RequestMapping("/list/{userid}")
	public @ResponseBody List<BookCartVO> list(
				@PathVariable("userid")String userid
			){
		logger.info("카트 컨트롤러 - list() 진입");
		logger.info("카트 컨트롤러 - list() 넘어온 유저아이디 : "+userid);
		List<BookCartVO> list = service.getList(userid);
		logger.info("카트 컨트롤러 list() 결과 : " + list.size());
		return list;
	}
	@RequestMapping("/BookIdList")
	public @ResponseBody List<?> getBooksInCart(
			HttpSession session
			){
		logger.info("카트 컨트롤러 - getBooksInCart() 진입");
		MemberVO member = (MemberVO) session.getAttribute("user");
		BooksInCart = service.getBooksInCart(member.getUserid());
		logger.info("카트 컨트롤러 getBooksInCart() 결과 : " + BooksInCart.size());
		return BooksInCart;
	}
	
	@RequestMapping("/UseridList")
	public @ResponseBody List<?> getUseridList(){
		logger.info("카트 컨트롤러 - getUseridList() 진입");
		List<?> list = service.getUseridList();
		logger.info("카트 컨트롤러 getUseridList() 결과 : " + list.size());
		return list;
	}
	
	@RequestMapping("/put")
	public Model put(
			String bookId,
			HttpSession session,
			Model model
			){
		logger.info("카트 컨트롤러 - put() 진입");
		logger.info("넘어온 북아이디 : {}",bookId);
		MemberVO member = (MemberVO) session.getAttribute("user");
		logger.info("카트 컨트롤러에서 받은 세션의 아이디 : {}"+member.getUserid());
		int result = service.put(bookId, member.getUserid());
		return model;
	}
	
	@RequestMapping("/change")
	public Model change(
			String data,
			Model model
			){
		logger.info("카트 컨트롤러 - change() 진입");
		logger.info("넘어온 북아이디 : {}",data);
		String[] result = data.split(",");
		logger.info("분리된 북아이디 : {}" ,result[0]);
		logger.info("분리된 수량 : {}" ,result[1]);
		
		
		
		
		return model;
	}
	
	@RequestMapping("/remove")
	public Model remove(
			String bookId,
			Model model
			){
		logger.info("카트 컨트롤러 = remove() 진입");
		logger.info("넘어온 북아이디 : {}", bookId);
		int result = service.remove(bookId);
		
		return model;
	}
	
	@RequestMapping("/removeUserid")
	public Model removeUserid(
			HttpSession session,
			Model model
			){
		logger.info("카트 컨트롤러 = removeUserid() 진입");
		MemberVO member = (MemberVO) session.getAttribute("user");
		int result = service.removeUserid(member.getUserid());
		return model;
	}
	
	
}
