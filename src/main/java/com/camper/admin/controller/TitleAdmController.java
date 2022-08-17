package com.camper.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.service.TitleAdmService;

@Controller
public class TitleAdmController {

	@Autowired TitleAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 타이틀 관리 목록
	// by.승진 2022-08-14
	@RequestMapping(value = "/titleList.go", method = RequestMethod.GET)
	public ModelAndView titleList() {
		return service.titleList();
	}
	
	
	// 타이틀 추가 페이지
	// by.승진 2022-08-14
	@RequestMapping(value = "/titleAdd.go", method = RequestMethod.GET)
	public String titleAddForm() {
		return "admin/titleAdmAdd";
	}
	
	
	// 타이틀 추가
	// by.승진 2022-08-14
	@RequestMapping(value = "/titleAdd.do", method = RequestMethod.POST)
	public ModelAndView titleAdd(@RequestParam HashMap<String, String> params) {
		return service.titleAdd(params);
	}
	
	
	// 타이틀 수정 페이지
	// by.승진 2022-08-14
	@RequestMapping(value = "/titleUpdate.go", method = RequestMethod.GET)
	public ModelAndView titleUpdateForm(@RequestParam String idx) {
		return service.titleUpdateForm(idx);
	}
	
	
	// 타이틀 수정
	// by.승진 2022-08-14
	@RequestMapping(value = "titleUpdate.do", method = RequestMethod.POST)
	public ModelAndView titleUpdate(@RequestParam HashMap<String, String> params) {
		return service.titleUpdate(params);
	}
	
}
