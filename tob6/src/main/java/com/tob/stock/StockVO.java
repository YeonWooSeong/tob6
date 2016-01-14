package com.tob.stock;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class StockVO  implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String  stockId;  // 고유번호
	private String  stockName; //
	public String getStockId() {
		return stockId;
	}
	public void setStockId(String stockId) {
		this.stockId = stockId;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "StockVO [stockId=" + stockId + ", stockName=" + stockName + "]";
	}
	
	 
}
