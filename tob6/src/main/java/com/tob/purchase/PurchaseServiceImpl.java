package com.tob.purchase;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tob.mapper.PurchaseMapper;

  
@Service
public class PurchaseServiceImpl implements PurchaseService{
	private static final Logger logger = LoggerFactory.getLogger(PurchaseServiceImpl.class);
	@Autowired private SqlSession sqlSession;
	@Autowired PurchaseVO purchase;
	
	@Override
	public int add(String userid, String bookId, String price) {
		logger.info("PurchaseServiceImpl : add 진입");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HHmmss");
		Calendar c1 = Calendar.getInstance();
		String purToday = sdf.format(c1.getTime());
    	String var = "-";
    	String strToday2 = sdf2.format(c1.getTime());
    	String result = purToday + var + strToday2;
    	
    	logger.info("넘어온 책 아이디 : " + bookId);
    	logger.info("넘어온 유저 아이디 : " + userid);
    	logger.info("넘어온 책 가격 : " + price);
    	logger.info("생성된 주문번호 : " + result);
    	int price_int = TypeChange(price);
    	logger.info("형 변환된 책 가격 : "+price_int);
    	purchase.setPurNum(result);
    	purchase.setSum(price_int);
    	purchase.setAccountNum(purToday);
    	purchase.setUserid(userid);
    	purchase.setBookid(bookId);
    	
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.add(purchase);
	}
	@Override
	public int TypeChange(String price) {
		String tTmp = "0", cTmp = "";
		 
		price = price.trim();
	    for(int i=0;i < price.length();i++){
	      cTmp = price.substring(i,i+1);
	      if(cTmp.equals("0") ||
	          cTmp.equals("1") ||
	          cTmp.equals("2") ||
	          cTmp.equals("3") ||
	          cTmp.equals("4") ||
	          cTmp.equals("5") ||
	          cTmp.equals("6") ||
	          cTmp.equals("7") ||
	          cTmp.equals("8") ||
	          cTmp.equals("9")){
	    	  tTmp += cTmp;
	      }
	    }
	    return(Integer.parseInt(tTmp));
	  } 
	@Override
	public PurchaseVO searchBypurNum(String purNum) {
		logger.info("PurchaseServiceImpl : searchBypurNum 진입");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.searchBypurNum(purNum);
	}
	@Override
	public List<PurchaseVO> searchByAccNum(String accountNum) {
		logger.info("PurchaseServiceImpl : searchByAccNum 진입");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.searchByAccNum(accountNum);
	}
	@Override
	public List<PurchaseVO> getList() {
		logger.info("PurchaseServiceImpl : getList 진입");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		List<PurchaseVO> list = mapper.getList();
		logger.info("getList 리턴값 : {}",list);
		return list;
	}
	@Override
	public int change(PurchaseVO o) {
		logger.info("PurchaseServiceImpl : change 진입");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.change(o);
	}
	@Override
	public int remove(String purNum) {
		logger.info("PurchaseServiceImpl : remove 진입");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.remove(purNum);
	}

}
