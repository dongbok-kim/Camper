package com.camper.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.service.CampingAdmService;
import com.camper.lib.utils.Criteria;

@Controller
public class CampingAdmController {

	@Autowired CampingAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//캠핑장 목록
	// 관리자 페이지 / 캠핑장 목록
	@RequestMapping(value = "/campingAdmList.go")
	public ModelAndView campingAdmList(Criteria cri,
			@RequestParam HashMap<String, Object> params) {
			
		return service.campingAdmList(cri, params);
	}
	
}
