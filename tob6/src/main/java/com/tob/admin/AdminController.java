package com.tob.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import com.tob.member.MemberServiceImpl;
import com.tob.member.MemberVO;
import com.tob.global.Constants;
import com.tob.global.FileUpload;
import com.tob.book.BookServiceImpl;
import com.tob.book.BookVO;
import com.tob.cart.CartServiceImpl;
import com.tob.cart.CartVO;
import com.tob.event.EventServiceImpl;
import com.tob.event.EventVO;
import com.tob.global.CommandFactory;
import com.tob.global.CommandFactory2;


@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

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
	@Autowired private EmailSender emailSender;
	
	int auth_Num = 0;
	
	
	@RequestMapping("/main")
	public String home(){
		logger.info("AdminController-home() 진입");
		logger.info("Admin");
		return "admin/admin/main.tiles";
	}
	
	@RequestMapping("/member_profile/{userid}")
	public @ResponseBody MemberVO memberProfile(
			@PathVariable("userid")String userid,
			Model model){
		logger.info("개인 프로필 진입");
		logger.info("가져온 아이디 {}",userid);
		member = memberService.searchById(userid);
		model.addAttribute("member", member);
		logger.info("멤버{}", member);
		
		return member;
		
	}

	
	@RequestMapping("/member_list")
	public String memberList(){
		logger.info("AdminController-member_list() 진입");
		return "admin/admin/memberList.tiles";
	}
	
	@RequestMapping(value="/member_update",method=RequestMethod.POST)
	public @ResponseBody MemberVO memberUpdate(
			@RequestParam("email")String email
			){
		logger.info("멤버컨트롤러 member_update() - 진입");
		member.setEmail(email);

		int result = memberService.change(member);
		if (result == 1) {
			logger.info("멤버 수정성공");
		} else {
			logger.info("멤버 수정실패");
		}
		return member;
	}
	
	@RequestMapping("/member_delete/{userid}")
	public @ResponseBody MemberVO memberDelete(
			@RequestParam("userid")String userid
			){
		
		logger.info("멤버컨트롤러 member_delete() - 진입");
		adminService.deletePurchase(userid);
		adminService.deleteCart(userid);
		int result = memberService.remove(userid);
		if (result == 1) {
			logger.info("멤버 삭제 성공");
		} else {
			logger.info("멤버 삭제 실패");
		}
		return member;
	}

	
	@RequestMapping("/member_list/{pageNo}")
	public @ResponseBody Map<String,Object> memberList(
			@PathVariable("pageNo")String pageNo,
			Model model){
		
		logger.info("AdminController memberList()");
		logger.info("넘어온 페이지번호 : {}",pageNo);

		int pageNumber = Integer.parseInt(pageNo);
		int pageSize = 10;
		int groupSize = 3;
		int count = memberService.count();
		
		int totalPage = count/pageSize;
		if (count%pageSize != 0) {
			totalPage += 1;
		}
		int startPage = pageNumber - ((pageNumber-1) % groupSize);
		int lastPage = startPage + groupSize -1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		
		logger.info("라스트페이지:{}",lastPage);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", memberService.getList(CommandFactory2.list(pageNo)));
		map.put("count", memberService.count());
		map.put("pageNo", pageNo);
		map.put("startPage", startPage);
		map.put("groupSize", groupSize);
		map.put("lastPage", lastPage);
		map.put("totalPage", totalPage);

		return map;
	}
	
	@RequestMapping(value="/admin_join", method=RequestMethod.POST)
	public Model adminJoin(
			@RequestBody AdminVO param,
			Model model
			){
		logger.info("멤버컨트롤러 joinAdmin() - 진입");
		logger.info("가입 아이디 : {}",param.getId());
		logger.info("가입 이메일 : {}",param.getAdminEmail());
		logger.info("가입 패스워드 : {}",param.getPassword());
		logger.info("가입 인증번호 : {}",param.getConfirm_num());
		int confirm_Num = Integer.parseInt(param.getConfirm_num());
		if (auth_Num == confirm_Num) {
			admin.setId(param.getId());
			admin.setPassword(param.getPassword());
			admin.setAdminEmail(param.getAdminEmail());
			int result = adminService.insert(admin);
			
			if (result == 1) {
				logger.info("관리자 등록 성공");
				model.addAttribute("result","success");
				model.addAttribute("id",admin.getId());
			} else {
				logger.info("관리자 등록 실패");
				model.addAttribute("result", "fail");
			}
		} 
		
		else {
			model.addAttribute("result", "not_Agreement");
		}
		
		return model;
	}
	
	@RequestMapping(value="/join_member", method=RequestMethod.POST)
	public Model joinMember(
			@RequestBody MemberVO param,
			Model model
			){
		logger.info("멤버컨트롤러 joinMember() - 진입");
		logger.info("가입 아이디 : {}",param.getUserid());
		logger.info("가입 패스워드 : {}",param.getPassword());
		logger.info("가입 인증번호 : {}",param.getName());
		
		
			member.setUserid(param.getUserid());
			member.setPassword(param.getPassword());
			member.setName(param.getName());
			member.setEmail(param.getEmail());
			member.setBirth(param.getBirth());
			member.setGender(param.getGender());
			member.setPhone(param.getPhone());
			member.setAddr(param.getAddr());

			
			int result = memberService.insert(member);
			
			if (result == 1) {
				logger.info("회원가입 성공");
				model.addAttribute("result","success");
				model.addAttribute("name",member.getName());
			} else {
				logger.info("회원가입 실패");
				model.addAttribute("result", "fail");
			}	
		
		return model;
	}
	
	@RequestMapping("/join_auth")
	public Model joinAuth (
			@RequestParam("id")String id,
			@RequestParam("adminEmail")String adminEmail, 
 		    Model model) throws Exception {
			Email email = new Email();
			
			
		logger.info("멤버컨트롤러 joinAuth() - 진입");
		logger.info("넘어온 id는?"+id);
		logger.info("넘어온 email은?"+adminEmail);
		logger.info("멤버컨트롤러 joinAuth() - 진입");
        
		
		AdminVO admin_Id_check = adminService.selectById(id);
        AdminVO admin_Email_check = adminService.selectByEmail(adminEmail);
		if (admin_Id_check != null) {
			model.addAttribute("id_fail", "id_fail");
		}
		else if (admin_Email_check != null) {
			model.addAttribute("email_fail", "email_fail");
		}
		else {
			
		}
		auth_Num = (int) (Math.random()*9999) + 1000;
        	String reciver = adminEmail;
        	String subject = "환영합니다.  "+id+"님, 인증번호 메일입니다.";
        	String content = id+" 님의 가입 인증번호는 "+auth_Num+"입니다.";
        			
        	email.setReciver(reciver);
        	email.setSubject(subject);
        	email.setContent(content);
        	emailSender.sendMail(email);
            model.addAttribute("success", "success");
        return model;
    }
	
	@RequestMapping("/join_Result")
	public String joinResult(){
		logger.info("멤버컨트롤러 joinResult() - 진입");
		
		return "member/join_Result";
	}
	

	@RequestMapping("/book_reg")
	public Model bookReg(
			Model model
			){
		logger.info("AdminController-bookreg() 페이지만 진입");
		return model;
	}

	
	@RequestMapping(value="/book_join", method=RequestMethod.POST)
	public Model bookJoin(
			@RequestBody BookVO param,
			Model model
			){
		logger.info("book_join 컨트롤러 진입");
		
		logger.info("책 아이디 : {}", param.getBookId());
		logger.info("책 이름 : {}", param.getBookName());
		logger.info("책 가격 : {}", param.getBookPrice());
		logger.info("책 작가 : {}", param.getWriter());
		logger.info("책 등급 : {}", param.getGrade());
		logger.info("책 재고량 : {}", param.getStockSeq());
		logger.info("책 옵션 : {}", param.getOptionBook());
		logger.info("책 장르 : {}", param.getGenreId());

		book.setBookId(param.getBookId());
		book.setBookName(param.getBookName());
		book.setBookPrice(param.getBookPrice());
		book.setWriter(param.getWriter());
		book.setGrade(param.getGrade());
		book.setStockSeq(param.getStockSeq());
		book.setOptionBook(param.getOptionBook());
		book.setGenreId(param.getGenreId());
		
		
		int result = bookService.registration(book);
        if (result == 1) {
            logger.info("북 등록 성공");
            model.addAttribute("result","success");
			model.addAttribute("bookName",book.getBookName());
        } else {
            logger.info("북 등록 실패");
            model.addAttribute("result", "fail");
        }
        return model;
		
	}
	
	@RequestMapping("/book_delete/{bookId}")
	public @ResponseBody BookVO bookDelete(
			@RequestParam("bookId")String bookId
			){
		
		logger.info("멤버컨트롤러 book_delete() - 진입");
		
		adminService.deleteCart(bookId);
		adminService.deletePurchase(bookId);
		
		int result = bookService.delete(bookId);
		if (result == 1) {
			logger.info("책 삭제성공");
		} else {
			logger.info("책 삭제실패");
		}
		return book;
	}
	
	@RequestMapping("/book_list/{pageNo}")
	public @ResponseBody Map<String,Object> bookList(
			@PathVariable("pageNo")String pageNo,
			Model model){
		
		int pageNumber = Integer.parseInt(pageNo);
		int pageSize = 10;
		int groupSize = 3;
		int count = adminService.count();
		int totalPage = count/pageSize;
		if (count%pageSize != 0) {
			totalPage += 1;
		}
		int startPage = pageNumber - ((pageNumber-1) % groupSize);
		int lastPage = startPage + groupSize -1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		
		logger.info("AdminController bookList()");
		logger.info("넘어온 페이지번호 : {}",pageNo);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", adminService.selectAll(CommandFactory2.list(pageNo)));
		map.put("count", count);
		map.put("totalPage", totalPage);
		map.put("pageNo", pageNumber);
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		map.put("groupSize", groupSize);
		return map;
	}
	
	
	@RequestMapping("/book_profile/{bookId}")
	public @ResponseBody BookVO bookProfile(
			@PathVariable("bookId")String bookId,
			Model model){
		logger.info("책 프로필 진입");
		logger.info("가져온 책 아이디 {}",bookId);
		book = bookService.searchByBook(bookId);
		model.addAttribute("book", book);
		logger.info("책{}", book);
		
		return book;	
	}
	
	@RequestMapping(value="/book_update",method=RequestMethod.POST)
	public @ResponseBody BookVO bookUpdate(

			@RequestParam("grade")String grade

			){
		logger.info("멤버컨트롤러 book_update() - 진입");

		book.setGrade(grade);

		int result = bookService.change(book);
		if (result == 1) {
			logger.info("컨트롤러 책 수정성공");
		} else {
			logger.info("컨트롤러 책 수정실패");
		}
		return book;
	}
	
	@RequestMapping("/today_book_search/{bookId}")
	public @ResponseBody BookVO todayBook(
			@PathVariable("bookId")String id ){
		logger.info("BookController:bookId()");
		logger.info("책 고유번호 : {}",id);
		book = bookService.searchByBook(id);
		logger.info("책 이름 : {}",book.getBookName());
		return book;
	}
	
	@RequestMapping("/bookSearch/{pageNo}/{bookId}")
	public @ResponseBody BookVO bookSearch(
			@PathVariable("pageNo")String pageNo, 
			@PathVariable("keyword")String keyword 
			
			){
		logger.info("bookSearch()");
		logger.info("검색 단어 : {}",keyword);
		logger.info("페이지 넘버 : {}",pageNo);
		List<BookVO> list = bookService.searchByBookName(CommandFactory.list(pageNo));
		logger.info("책 이름 : {}",list);
		return book;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/event_reg")
	public String eventreg(){
		logger.info("AdminController-eventreg() 진입");
		return "admin/admin/eventReg.tiles";
	}
	
	@RequestMapping("/event_list")
	public String eventList(){
		logger.info("AdminController-eventList() 진입");
		return "admin/admin/eventList.tiles";
	}
	
	@RequestMapping("/event_list/{pageNo}")
	public @ResponseBody Map<String,Object> eventList(
			@PathVariable("pageNo")String pageNo,
			Model model){
		
		int pageNumber = Integer.parseInt(pageNo);
		int pageSize = 5;
		int groupSize = 3;
		int count = eventService.count();
		int totalPage = count/pageSize;
		if (count%pageSize != 0) {
			totalPage += 1;
		}
		int startPage = pageNumber - ((pageNumber-1) % groupSize);
		int lastPage = startPage + groupSize -1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		
		logger.info("AdminController eventList()");
		logger.info("넘어온 페이지번호 : {}",pageNo);
		Map<String,Object> map = new HashMap<String,Object>();
		/*map.put("list", bookService.getList(CommandFactory.list(pageNo)));*/
		map.put("count", count);
		map.put("totalPage", totalPage);
		map.put("pageNo", pageNumber);
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		map.put("groupSize", groupSize);
		return map;
	}
	


	
}