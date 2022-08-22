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
	
	@RequestMapping(value = "/ageAdmList.go", method = RequestMethod.GET)
	public String ageList(Model model) {
		
		String page ="admin/ageAdmList";
		service.ageList(model);
		return page;
	}
// 연령대 등록 페이지로
	@RequestMapping(value = "/ageAdmReg.go")
	public String ageAdmReg(Model model) {
		
		return "admin/ageAdmReg";
	}
	
	@RequestMapping(value = "/ageReg.do")
	public String ageRegForm(Model model, @RequestParam int ma_age) {
		
		int success = service.ageReg(ma_age);
		logger.info("success:"+success);
		return "admin/ageAdmReg";
	}
	
// 연령대 수정 페이지로 이동
	@RequestMapping(value = "/ageUpdate.go")
	public String ageUpdate(Model model, @RequestParam int ma_idx) {
		logger.info("age"+ma_idx);
		service.ageUpdate(model,ma_idx);
		return "admin/ageAdmUpdate";
	}
// 연령대 수정	
	@RequestMapping(value = "/ageUpdate.do")
	public String ageUpdateForm(Model model, 
			@RequestParam int ma_age, @RequestParam int ma_idx) {
		logger.info("age"+ma_age+ma_idx);
		int success = service.ageUpdateForm(model,ma_idx,ma_age);
		return "redirect:/ageAdmList.go";
	}
	
	
}
