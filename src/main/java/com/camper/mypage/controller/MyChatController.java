package com.camper.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.service.MyChatService;

@Controller
public class MyChatController {

	@Autowired MyChatService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/myChatList.do", method = RequestMethod.GET)
	public ModelAndView myChatList() {
		return service.myChatList();
	}
	
}
