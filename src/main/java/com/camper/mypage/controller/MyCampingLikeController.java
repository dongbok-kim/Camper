package com.camper.mypage.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.service.MyCampingLikeService;

@Controller
public class MyCampingLikeController {

	@Autowired MyCampingLikeService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/myCampingLikeList.go")
	public ModelAndView myCampingLikeList() {
		return service.myCampingLikeList();
	}
	
}
