package com.camper.mypage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.service.MyCampingLikeService;

@Controller
public class MyCampingLikeController {

	@Autowired MyCampingLikeService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 캠핑장 찜 목록
	// by. 승진 2022-08-08
	@RequestMapping(value = "/myCampingLikeList.go", method = RequestMethod.GET)
	public ModelAndView myCampingLikeList(HttpSession session) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		return service.myCampingLikeList(loginId);
	}
	
	// 캠핑장 찜해제
	// by. 승진 2022-08-08
	@RequestMapping(value = "/myCampingLikeDelete.do", method = RequestMethod.GET)
	public ModelAndView myCampingLikeDelete(HttpSession session, @RequestParam String idx) {
		// String loginId = (String) session.getAttribute("loginId");
		String temporaryId = "jin";
		return service.myCampingLikeDelete(idx, temporaryId);
	}
	
}
