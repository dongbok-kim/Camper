package com.camper.lib.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.lib.service.CommonService;

@Controller
public class CommonController {

	@Autowired CommonService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 캠핑장 찜해제
	// by. 승진 2022-08-11
	@RequestMapping(value = "/campingLikeDelete.do", method = RequestMethod.GET)
	public ModelAndView campingLikeDelete(HttpSession session, @RequestParam String idx) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		return service.campingLikeDelete(idx, loginId);
	}
	
	
	// 블라인드 등록
	// by. 승진 2022-08-11
	@RequestMapping(value = "/blind.do", method = RequestMethod.GET)
	public ModelAndView blind(HttpSession session, @RequestParam String idx) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		return service.blind(idx, loginId);
	}
	
}
