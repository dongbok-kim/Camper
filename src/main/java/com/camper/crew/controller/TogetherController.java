package com.camper.crew.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.camper.crew.service.TogetherService;

@Controller
public class TogetherController {

	@Autowired TogetherService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
}
