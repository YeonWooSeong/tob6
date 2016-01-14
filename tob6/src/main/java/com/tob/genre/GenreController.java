package com.tob.genre;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/genre")
public class GenreController {
	
	private static final Logger logger = LoggerFactory.getLogger(GenreController.class);
	
@Autowired GenreServiceImpl service;
@Autowired GenreVO genre;

// 카테고리 아이디를 통한 장르 보여주기

@RequestMapping("/Genre")
public Model list(Model model){
	logger.info("genreController:list() 진입");
	
	List<GenreVO> list = service.selectAll();
	
		System.out.println("리스트는?"+list);
		List<String> test = new ArrayList<String>();
	List<GenreVO> listAbroad = new ArrayList<GenreVO>();
	List<GenreVO> listOld = new ArrayList<GenreVO>();
	List<GenreVO> listDomestic = new ArrayList<GenreVO>();
	List<GenreVO> listEbook = new ArrayList<GenreVO>();
	List<GenreVO> listNew = new ArrayList<GenreVO>();
	
	
		for (int i = 0; i < list.size();  i++) {
			if (list.get(i).getCategoryId().equals("abroad")) {
				
				listAbroad.add(list.get(i));
				/*listAbroad = list*/
				System.out.println("리스트 어브로드는?"+listAbroad);
			}
			
			if (list.get(i).getCategoryId().equals("old")) {
				listOld.add(list.get(i));
				System.out.println("리스트 올드는?"+listOld);
			}
			if (list.get(i).getCategoryId().equals("domestic")) {
				listDomestic.add(list.get(i));
				System.out.println("리스트 도매스틱은?"+listDomestic);
			}
			if (list.get(i).getCategoryId().equals("ebook")) {
				listEbook.add(list.get(i));
				System.out.println("리스트 이북은?"+listEbook);
			}
			if (list.get(i).getCategoryId().equals("new")) {
				listNew.add(list.get(i));
				System.out.println("리스트 뉴우는?"+listNew);
			}
		
		}
	
	
	
	
	logger.info("전체 장르는? : {}",list);
	logger.info("abroad는? : {}",listAbroad);
	logger.info("old는? : {}",listOld);
	logger.info("domstic는? : {}",listDomestic);
	logger.info("ebook는? : {}",listEbook);
	logger.info("new는? : {}",listNew);
	model.addAttribute("listAbroadName","해외도서");
	model.addAttribute("listAbroad", listAbroad);
	
	model.addAttribute("listDomesticName","국내도서");
	model.addAttribute("listDomestic", listDomestic);
	
	model.addAttribute("listEbookName","전자책");
	model.addAttribute("listEbook", listEbook);
	
	model.addAttribute("listNewName","신간");
	model.addAttribute("listNew", listNew);
	
	model.addAttribute("listOldName","중고책");
	model.addAttribute("listOld", listOld);
	
	return model;
	
}


@RequestMapping("/Genre2")
public Model list2(Model model){
	logger.info("genreController:list2() 진입");
	
	List<GenreVO> list = service.selectAll();
	model.addAttribute("list",list);
	logger.info("list 정보 : {}",list);
		
		return model;
}







@RequestMapping("/Genre3")
public List<GenreVO> list3(Model model){
	logger.info("genreController:list3() 진입");
	List<GenreVO> list = service.selectAll();
	logger.info("list3 길이 : {}",list.size());
		
		return list;
}
}
