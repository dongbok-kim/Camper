package com.camper.profile.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.camper.profile.service.ProfileService;

@Controller
public class ProfileController {

	@Autowired ProfileService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
}
