package com.tob.member;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.tob.cart.BookCartVO;
import com.tob.global.Constants;
import com.tob.global.FileUpload;



@Controller
@SessionAttributes("user")
@RequestMapping("/member")
public class MemberController {
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    @Autowired MemberServiceImpl service;
    @Autowired MemberVO member;

    @RequestMapping("/joinForm")
    public String joinForm(){
        logger.info("멤버컨트롤러 joinForm() - 진입");
        return "member/join.tiles";
    }
    @RequestMapping("/loginForm")
    public String loginForm(){
        logger.info("멤버컨트롤러 loginForm() - 진입");
        return "member/login.tiles";
    }
    
    @RequestMapping("/mypageForm")
    public String mypagForm(){
        logger.info("멤버컨트롤러 mypageForm() - 진입");
        return "member/mypage.tiles";
    }
    @RequestMapping("/join")
    public @ResponseBody MemberVO insert(
    		@RequestBody MemberVO param){
        logger.info("멤버컨트롤러 join 진입");
        
        member.setUserid(param.getUserid());
        member.setPassword(param.getPassword());
        member.setName(param.getName());
        member.setBirth(param.getBirth());
        logger.info("생년 join :{}",param.getBirth());
        member.setGender(param.getGender());
        logger.info("성별 join :{}",param.getGender());
        member.setEmail(param.getEmail());
        member.setPhone(param.getPhone());
        member.setAddr(param.getAddr());
        member.setProfile("default.png");
        int result = service.insert(member);
        if (result == 1) {
            logger.info("회원가입 성공");
            
        } else {
            logger.info("회원가입 실패");
           
        }
        return member;
    }
    @RequestMapping("/login")
    public @ResponseBody MemberVO selectOneBy(
    		@RequestParam("userid")String userid,
    		@RequestParam("password")String password,
    		HttpSession session,
    		Model model){
        logger.info("멤버컨트롤러 login() - 진입");
        logger.info("넘어온 유저아이디 : {}",userid);
        logger.info("유저비번 : {}",password);
        member = service.selectOneBy(userid);
        System.out.println("member = service.selectOneBy(userid) 통과"+member.getUserid());
        if (member != null) {
            logger.info("로그인성공");
            session.setAttribute("user", member);
        } else {
            logger.info("로그인실패");
        }
        return member;
    }
    @RequestMapping("/logout")
    public String logout(Model model,SessionStatus status){
        logger.info("멤버컨트롤러 logout() - 진입");
        status.setComplete();
        return "redirect:/";
    }
    @RequestMapping("/detail/{userid}")
    public @ResponseBody MemberVO detail(
            @PathVariable("userid")String userid
    		){
        logger.info("멤버컨트롤러 detail() - 진입");
        member = service.selectOneBy(userid);
        logger.info("멤버컨트롤러 :"+member.getProfile());
        return member;
    }
    @RequestMapping(value="/update",method=RequestMethod.POST)
    public @ResponseBody MemberVO update(
    		@RequestParam(required=false,value="file")MultipartFile multipartFile,
            @RequestParam("userid")String userid,
            @RequestParam("password")String password,
            @RequestParam("addr")String addr,
            @RequestParam("email")String email,
            @RequestParam("phone")String phone){
        logger.info("멤버컨트롤러 update() - 진입");
        String path = Constants.imageDomain+"resources\\images\\";
		FileUpload fileUpload = new FileUpload();
		String fileName = multipartFile.getOriginalFilename();
		String fullPath = fileUpload.uploadFile(multipartFile,path,fileName);
		logger.info("파일업로드 경로 : {}",fullPath);
        member.setPassword(password);
        member.setAddr(addr);
        member.setEmail(email);
        member.setPhone(phone);
        member.setProfile(fileName);
        int result = service.change(member);
        if (result == 1) {
            logger.info("멤버컨트롤러 수정성공");
        } else {
            logger.info("멤버컨트롤러 수정실패");
        }
        return member;
    }
    @RequestMapping("/updateForm/{userid}")
    public @ResponseBody MemberVO updataForm(
    		@PathVariable("userid")String userid
    		){
    	logger.info("아이디들어옴 : "+userid);
    	return member;
    }
    @RequestMapping("/remove/{userid}")
    public @ResponseBody MemberVO remove(
    		@PathVariable("userid")String userid
    		){
    	logger.info("remove :"+userid);
    	int result = service.remove(userid);
        if (result == 1) {
            logger.info("회원탈퇴 성공");
            
        } else {
            logger.info("회원탈퇴 실패");
           
        }
        return member;
    }
    @RequestMapping("/list/{userid}")
	public @ResponseBody List<BookCartVO> cartlist(
				@PathVariable("userid")String userid
			){
		logger.info("카트 컨트롤러 - list() 진입");
		logger.info("카트 컨트롤러 - list() 넘어온 유저아이디 : "+userid);
		List<BookCartVO> list = service.getList(userid);
		logger.info("카트 컨트롤러 list() 결과 : " + list.size());
		return list;
	}
    /*@RequestMapping("")*/
}
