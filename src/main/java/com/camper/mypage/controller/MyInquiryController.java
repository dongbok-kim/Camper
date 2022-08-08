package com.camper.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.camper.mypage.service.MyInquiryService;

@Controller
public class MyInquiryController {

	@Autowired MyInquiryService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
}
