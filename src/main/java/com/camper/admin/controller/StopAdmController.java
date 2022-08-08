package com.camper.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.camper.admin.service.StopAdmService;

@Controller
public class StopAdmController {

	@Autowired StopAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
}
