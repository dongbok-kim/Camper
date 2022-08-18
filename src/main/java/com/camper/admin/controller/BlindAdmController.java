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

import com.camper.admin.service.BlindAdmService;

@Controller
public class BlindAdmController {

	@Autowired BlindAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/blindAdmList.go")
	public ModelAndView blindAdmList() {
		
		return service.blindList();
	}
	
	@RequestMapping(value = "/blindAdmSearch.do")
	public ModelAndView blindAdmSearch(@RequestParam HashMap<String, String> params) {
		logger.info("search : "+params);
		return service.blindSearch(params);
	}
	
}
