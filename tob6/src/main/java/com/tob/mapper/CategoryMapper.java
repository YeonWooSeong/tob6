package com.tob.mapper;

import org.springframework.stereotype.Repository;

import com.tob.category.CategoryVO;

@Repository
public interface CategoryMapper {

public	int registration(CategoryVO o);

public int delete(String category);
 
public CategoryVO searchByCategory(String category);

}
