package com.camper.camping.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camper.camping.service.CampingApiService;

@Controller
public class CampingApiController {

	@Autowired CampingApiService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//@Scheduled 예정
	@RequestMapping (value = "/campingApi.go")
    public String setCampingApi() throws Exception {
    	return service.setCampingApi();	
    }
	
	
	
}
