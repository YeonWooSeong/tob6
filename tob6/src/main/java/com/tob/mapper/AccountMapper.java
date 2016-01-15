package com.tob.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tob.account.AccountVO;
import com.tob.book.BookVO;
import com.tob.global.Command;
import com.tob.purchase.PurchaseVO;

@Repository
public interface AccountMapper {
	
	public int selectTotal(String key); 				// 전체조회
	
	public List<String> ratio();		// 장르
	
	public List<PurchaseVO> dayList(AccountVO account);

	
	
	
	
}