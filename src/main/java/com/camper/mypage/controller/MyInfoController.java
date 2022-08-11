package com.camper.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camper.mypage.service.MyInfoService;

@Controller
public class MyInfoController {

	@Autowired MyInfoService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
		//내정보 수정 이동
		@RequestMapping(value = "/mypageInfo.go")
		public String loginPage(Model model) {
			
			return "mypage/myInfoView";
		}
	
}
