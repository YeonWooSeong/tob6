package com.tob.mapper;

import org.springframework.stereotype.Repository;

import com.tob.stock.StockVO;

@Repository

public interface StockMapper {

public	int registration(StockVO o);

public int delete(String stock);

}
 