package com.camper.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.camper.login.service.LoginService;

@Controller
public class StopSchedulerController {

@Autowired LoginService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void stopLogin() throws Exception {
		// logger.info("스케줄러 확인");
		
	service.stopCnt();
	}
	
}
