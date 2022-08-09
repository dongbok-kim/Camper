package com.camper.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camper.admin.service.ReportAdmService;

@Controller
public class ReportAdmController {
	
	@Autowired ReportAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/reportList")
	public String reportList(Model model) {
		
		service.reportList(model);
		return "admin/reportList";
	}
	
	@RequestMapping(value = "/reportView")
	public String reportView(Model model,
			@RequestParam int rp_idx) {
		
		service.reportView(model, rp_idx);
		return "admin/reportView";
	}

}
