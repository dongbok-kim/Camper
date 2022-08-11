package com.camper.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.service.ReviewAdmService;

@Controller
public class ReviewAdmController {

	@Autowired ReviewAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 캠핑장 후기 관리
	@RequestMapping(value = "/reviewAdmList")
	public ModelAndView reviewAdmList() {
		
		return service.reviewCampList();
	}
	
	
	
	// 회원 후기 관리
	@RequestMapping(value = "/reviewMemberAdmList")
	public ModelAndView reviewMemberAdmList() {
		
		return service.reviewMemberList();
	}
	
}
