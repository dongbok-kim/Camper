package com.camper.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camper.admin.service.ReportAdmService;

@Controller
public class ReportAdmController {
	
	@Autowired ReportAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/reportList")
	public String ageReg(Model model) {
		
		service.reportList(model);
		return "admin/ageReg";
	}

}
