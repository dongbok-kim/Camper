package com.camper.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.service.TogetherAdmService;
import com.camper.lib.service.CommonService;

@Controller
public class TogetherAdmController {

	@Autowired TogetherAdmService service;
	@Autowired CommonService comService;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//모집글 목록
	@RequestMapping(value = "/togetherAdmList")
	public ModelAndView togetherAdmList() {
			
		return service.togetherList();
	}
	
	// 모집글 블라인드
	@RequestMapping(value = "/blindTogether.do")
	public String blindTogether(@RequestParam HashMap<String, String> params) {
		// String loginId = (String)session.getAttribute("loginId");
		String loginId = "ryu"; // 임시 관리자
		params.put("mb_id", loginId);
		params.put("relation", "cp_crew_together");
		
		logger.info("params"+params);
		comService.blind(params);
		return "redirect:/togetherAdmList";
	}
	
	// 모집글 상세보기 불러오기
	@RequestMapping(value = "/togetherAdmView")
	public ModelAndView blindTogetherView(@RequestParam int ct_idx) {
		logger.info("모집글 상세보기 요청"+ct_idx);
		return service.togetherView(ct_idx);
	}

	
}
