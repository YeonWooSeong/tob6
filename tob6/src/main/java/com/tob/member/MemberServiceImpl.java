package com.tob.member;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tob.cart.BookCartVO;
import com.tob.cart.TodayCartVO;
import com.tob.global.Command;
import com.tob.global.Command2;
import com.tob.mapper.CartMapper;
import com.tob.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired private SqlSession sqlSession;
	@Autowired TodayCartVO todaycart;
		@SuppressWarnings("unused")
		@Override
		public String joinForm() {
			logger.info("MemberServiceImpl : joinForm");
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return "member/join.tiles";
		}
		public String loginForm() {
			logger.info("MemberServiceImpl : loginForm");
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return "member/login.tiles";
		}
		public String mypageForm() {
			logger.info("MemberServiceImpl : mypageForm");
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return "member/mypage.tiles";
		}
		@Override
		public int insert(MemberVO member) {
			logger.info("MemberServiceImpl : insert");
			logger.info("MemberServiceImpl 아이디 : {}",member.getUserid());
			logger.info("MemberServiceImpl : {}");
			logger.info("MemberServiceImpl : {}");
			logger.info("MemberServiceImpl : {}");
			logger.info("MemberServiceImpl : {}");
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.insert(member);
		}
		@Override
		public int change(MemberVO member) {
			logger.info("MemberServiceImpl : change");
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.update(member);
		}
		@Override
		public int remove(String userid) {
			logger.info("MemberServiceImpl : remove");
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.remove(userid);
		}
		@Override
		public MemberVO selectOneBy(String userid) {
			logger.info("MemberServiceImpl : login");
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.selectOneBy(userid);
		}
		@Override
		public int count() {
			logger.info("MemberServiceImpl : count");
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.count();
		}
		@Override
		public MemberVO searchById(String userid) {
			logger.info("MemberServiceImpl : selectById");
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.selectOneBy(userid);
		}
		@Override
		public List<MemberVO> searchBySearchword(String domain,String searchword) {
			logger.info("MemberServiceImpl : searchBySearchword");
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.selectSomeBy(domain, searchword);
		}
		@Override
		public List<MemberVO> getList(Command2 command) {
			logger.info("MemberServiceImpl : getList");
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.selectAll(command);
		}
		@Override
		public int changePwd(MemberVO member) {
			logger.info("MemberServiceImpl : changePwd");
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.changePwd(member);
		}
		@Override
		public MemberVO logout(String userid, String password) {
		logger.info("MemberServiceImpl : logout");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.logout(userid,password);
		}	
		@Override
		public List<BookCartVO> getList(String userid) {
			logger.info("MemberServiceImpl : getList 진입");
			logger.info("넘어온 유저아이디 : " + userid);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Calendar c1 = Calendar.getInstance();
			String today = sdf.format(c1.getTime());
			todaycart.setUserid(userid);
			todaycart.setToday(today);
			
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.getList(todaycart);
		}
		
}
		