package com.camper.mypage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.service.MyCrewService;

@Controller
public class MyCrewController {

	@Autowired MyCrewService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 내가 참여한 크루 목록
	// by. 승진 2022-08-09
	@RequestMapping(value = "/myCrewList.go", method = RequestMethod.GET)
	public ModelAndView myCrewWriteList(HttpSession session) {
		// String loginId = (String) session.getAttribute("loginId");
		String temporaryId = "jin";
		return service.myCrewList(temporaryId);
	}
	
	
	
}
