package com.camper.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.service.TogetherAdmService;
import com.camper.lib.service.CommonService;
import com.camper.lib.utils.Criteria;

@Controller
public class TogetherAdmController {

	@Autowired TogetherAdmService service;
	@Autowired CommonService comService;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//모집글 목록
	@RequestMapping(value = "/togetherAdmList.go")
	public ModelAndView togetherAdmList(Criteria cri,
			@RequestParam HashMap<String, Object> params) {
		logger.info("관리자 페이지/모집글 목록");	
		return service.togetherList(cri, params);
	}
	
	// 모집글 블라인드
	@RequestMapping(value = "/blindTogether.do")
	public String blindTogether(HttpSession session,
			@RequestParam HashMap<String, String> params) {
		String loginId = (String)session.getAttribute("loginId");
		params.put("mb_id", loginId);
		params.put("relation", "cp_crew_together");
		
		logger.info("params"+params);
		comService.blind(params);
		return "redirect:/togetherAdmList.go";
	}
	
	// 모집글 상세보기 불러오기
	@RequestMapping(value = "/togetherAdmView", method = RequestMethod.GET)
	public ModelAndView blindTogetherView(@RequestParam int ct_idx,
			@RequestParam HashMap<String, Object>params, Criteria cri) {
		logger.info("모집글 상세보기 요청"+params);
		return service.togetherView(ct_idx, cri, params);
	}

	
}
