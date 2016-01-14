package com.tob.purchase;

import java.util.List;

public interface PurchaseService {
  
	// 주문내역 추가
		public int add(String userid, String bookId, String price);
		
		// 주문내역 (주문번호로) 조회
		public PurchaseVO searchBypurNum(String purNum);
		
		// 주문내역 (Account_Num)으로 조회
		public List<PurchaseVO> searchByAccNum(String accountNum);
		
		// 전체 주문내역 조회
		public List<PurchaseVO> getList();
		
		// 주문내역 수정
		public int change(PurchaseVO o);
		
		// 주문내역 삭제
		public int remove(String purNum);
		
		// 형변환 예외처리
		public int TypeChange(String price);
}
