package com.camper.chat.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.camper.chat.dto.ChatDTO;
import com.camper.chat.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired ChatService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public ModelAndView chat(@ModelAttribute ChatDTO cg_idx) {
		return service.chat(cg_idx);
	}
	
	@RequestMapping(value = "/crewTogetherDeadline.ajax", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> crewTogetherDeadline(@RequestParam int ct_idx) {
		return service.crewTogetherDeadline(ct_idx);
	}
	
}
