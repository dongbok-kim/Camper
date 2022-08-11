package com.camper.main.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.camper.main.dto.MainDTO;
import com.camper.main.service.MainService;

@Controller
public class MainController {

	@Autowired MainService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
		
		//캠핑장 랜덤 리스트
		ArrayList<MainDTO>list = service.list();
		model.addAttribute("list", list);
		
		//크루모집 랜덤 리스트
		ArrayList<MainDTO>crew = service.crew();
		model.addAttribute("crew", crew);
		logger.info("메인입니다.");
			
		return "main";
	}
	
}
