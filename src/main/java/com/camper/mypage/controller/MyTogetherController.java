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

import com.camper.mypage.service.MyTogetherService;

@Controller
public class MyTogetherController {

	@Autowired MyTogetherService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
		// 내가 쓴 크루모집글 목록
		// by. 승진 2022-08-09
		@RequestMapping(value = "/myCrewWriteList.go", method = RequestMethod.GET)
		public ModelAndView myCrewWriteList(HttpSession session) {
			// String loginId = (String) session.getAttribute("loginId");
			String loginId = "jin";
			return service.myCrewWriteList(loginId);
		}
		
		
		// 내가 쓴 크루모집글 삭제
		// by. 승진 2022-08-09
		@RequestMapping(value = "/myCrewWriteDelete.do", method = RequestMethod.GET)
		public ModelAndView myCrewWriteDelete(HttpSession session, @RequestParam String idx) {
			// String loginId = (String) session.getAttribute("loginId");
			String loginId = "jin";
			return service.myCrewWriteDelete(idx, loginId);
		}
	
}
