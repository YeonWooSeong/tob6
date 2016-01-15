package com.tob.account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tob.book.BookVO;
import com.tob.purchase.PurchaseVO;

@Service
public interface AccountService {
	// R : 날짜별 주문금액
	public int getTotal(String key);				    // 날짜별 금액 리스트 
	
	public List<String> ratio();				    // 장르 비율 
	
	public List<PurchaseVO> dayList(AccountVO account);
	

}
