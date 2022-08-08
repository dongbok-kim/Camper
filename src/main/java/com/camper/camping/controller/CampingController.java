package com.camper.camping.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.camper.camping.service.CampingService;

@Controller
public class CampingController {

	@Autowired CampingService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
}
