package com.camper.camping.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.camper.camping.service.CampingApiService;

@Controller
public class CampingApiController {

	@Autowired CampingApiService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
}
