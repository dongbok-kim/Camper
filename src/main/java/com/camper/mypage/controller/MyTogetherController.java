package com.camper.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.camper.mypage.service.MyTogetherService;

@Controller
public class MyTogetherController {

	@Autowired MyTogetherService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
}
