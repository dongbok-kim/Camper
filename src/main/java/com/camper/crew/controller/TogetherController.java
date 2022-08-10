package com.camper.crew.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camper.crew.dto.TogetherDTO;
import com.camper.crew.service.TogetherService;

@Controller
public class TogetherController {

	@Autowired TogetherService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//크루모집 목록
	@RequestMapping(value = "/crewTogetherList.do")
	public String crewTogetherList (Model model) {
		String page="crewTogetherList";
		
		ArrayList<TogetherDTO>list=service.list();
		model.addAttribute("list",list);
		
		return page;
	}
	
	
	//크루모집 상세보기
	@RequestMapping(value="/crewTogetherView.do")
	public String crewTogetherView(@RequestParam int ct_idx, Model model) {
		String page = "crewTogetherView";
		logger.info(ct_idx+"번 크루모집 상세보기");
		
		TogetherDTO dto=service.view(ct_idx);
		model.addAttribute("cct",dto);
		
		return page;
			
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
