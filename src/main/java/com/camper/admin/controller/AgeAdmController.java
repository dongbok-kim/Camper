package com.camper.admin.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.camper.admin.service.AgeAdmService;

@Controller
public class AgeAdmController {

	@Autowired AgeAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/ageAdm", method = RequestMethod.GET)
	public String ageadm(Model model) {
		
		return "admin/ageAdm";
	}
	
	@RequestMapping(value = "/ageReg")
	public String ageReg(Model model) {
		
		return "admin/ageReg";
	}
	
	@RequestMapping(value = "/ageReg.do")
	public String ageRegForm(Model model, @RequestParam int age) {
		logger.info("age:"+age);
		int success = service.ageReg(age);
		logger.info("success:"+success);
		return "admin/ageReg";
	}
	
	
	
}
