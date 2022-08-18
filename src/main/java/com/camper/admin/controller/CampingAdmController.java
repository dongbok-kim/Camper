package com.camper.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.service.CampingAdmService;

@Controller
public class CampingAdmController {

	@Autowired CampingAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//캠핑장 목록
	@RequestMapping(value = "/campingAdmList")
	public ModelAndView campingAdmList() {
			
		//return service.answerList();
		return null;
	}
	
}
