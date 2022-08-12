package com.camper.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.service.TogetherAdmService;

@Controller
public class TogetherAdmController {

	@Autowired TogetherAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/togetherAdmList")
	public ModelAndView togetherAdmList() {
			
		return service.togetherList();
	}
	
	// 모집글 블라인드
	@RequestMapping(value = "/blindTogether.do")
	public ModelAndView blindTogether(@RequestParam HashMap<String, String> params) {
		logger.info("params"+params);
		return null;
	}
	
}
