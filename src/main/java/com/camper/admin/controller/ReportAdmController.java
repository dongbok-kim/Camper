package com.camper.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
	
	// 회원 신고 목록
	@RequestMapping(value = "/reportAdmList.go")
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
	public String reportUpdate(HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
		
		//String rp_admin = (String) session.getAttribute("loginId"); //신고처리 관리자아이디
		String rp_admin = "ryu"; //임시
		params.put("rp_admin", rp_admin);
		service.reportUpdate(params);
		
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
