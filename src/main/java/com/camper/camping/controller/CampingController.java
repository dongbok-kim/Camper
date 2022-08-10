package com.camper.camping.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.camping.service.CampingService;

@Controller
public class CampingController {

	@Autowired CampingService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping (value = "/campingList.go")
    public ModelAndView campingList(HttpSession session) {
    	return service.campingList(session);	
    }
	
	@RequestMapping (value = "/campingView")
    public ModelAndView campingView(HttpSession session, @RequestParam String ca_idx) {
		logger.info(ca_idx + "번 요청");
    	return service.campingView(session, ca_idx);	
    }
	
}
