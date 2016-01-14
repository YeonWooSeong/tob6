package com.tob.mapper;

import org.springframework.stereotype.Repository;

import com.tob.option2.Option2VO;

@Repository

public interface Option2Mapper {

public	int registration(Option2VO o);

public int delete(String option2);

public Option2VO searchByOption2(String option2);

}
 