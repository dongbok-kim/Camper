package com.camper.chat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.camper.chat.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired ChatService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public ModelAndView chat() {
		return service.chat();
	}
	
}
