package com.camper.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.camper.admin.service.CampingAdmService;

@Controller
public class CampingAdmController {

	@Autowired CampingAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
}
