package com.camper.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.service.ReportAdmService;

@Controller
public class ReportAdmController {
	
	@Autowired ReportAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/reportAdmList")
	public String reportAdmList(Model model) {
		
		service.reportList(model);
		return "admin/reportAdmList";
	}
	
	@RequestMapping(value = "/reportAdmView")
	public String reportAdmView(Model model,
			@RequestParam int rp_idx) {
		
		service.reportView(model, rp_idx);
		return "admin/reportAdmView";
	}
	
	@RequestMapping(value = "/reportUpdate.do")
	public String reportUpdate(Model model,
			@RequestParam HashMap<String, String> params
			,  MultipartFile[] rp_img) {
		
		// 이미지 저장 기능 임시작업
		logger.info("selected : "+ params);
		service.reportUpdate(params, rp_img);
		
		String page = "redirect:/reportAdmView?rp_idx="+params.get("rp_idx");
		return page;
	}
	
	@RequestMapping(value = "/reportSearch.do")
	public ModelAndView reportSearch(
			@RequestParam HashMap<String, String> params) {
		logger.info("파람 : {}",params);
		
		return service.reportSearch(params);
	}
	

}
