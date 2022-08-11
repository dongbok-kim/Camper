package com.camper.mypage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.service.MyReviewService;

@Controller
public class MyReviewController {

	@Autowired MyReviewService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 캠핑장 후기작성
	// by.승진 2022-08-11
	@RequestMapping(value = "/campingReviewForm.go", method = RequestMethod.GET)
	public ModelAndView campingReviewForm(HttpSession session, @RequestParam String idx) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		return service.campingReviewForm(idx, loginId);
	}
	
	
	// 크루원 후기작성
	// by.승진 2022-08-11
	@RequestMapping(value = "/crewReviewForm.go", method = RequestMethod.GET)
	public ModelAndView crewReviewForm(HttpSession session, @RequestParam String idx) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		return service.crewReviewForm(idx, loginId);
	}
	
}
