package com.camper.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.service.ReviewAdmService;
import com.camper.lib.service.CommonService;
import com.camper.lib.utils.Criteria;

@Controller
public class ReviewAdmController {

	@Autowired ReviewAdmService service;
	@Autowired CommonService comService;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 캠핑장 후기 관리
	@RequestMapping(value = "/reviewAdmList.go")
	public ModelAndView reviewAdmList(Criteria cri, 
			@RequestParam HashMap<String, Object> params) {
		return service.reviewCampList(cri, params);
	}
	
	// 캠핑장 후기 블라인드
	@RequestMapping(value = "/blindCamping.do")
	public String blindCamping(HttpSession session,
			@RequestParam HashMap<String, String> params) {
		String loginId = (String)session.getAttribute("loginId");
		params.put("mb_id", loginId);
		params.put("relation", "cp_camping_review");
		
		logger.info("params"+params);
		comService.blind(params);
		return "redirect:/reviewAdmList.go";
	}
	
	
	
	// 회원 후기 관리 목록
	@RequestMapping(value = "/reviewMemberAdmList.go")
	public ModelAndView reviewMemberAdmList(Criteria cri,
			@RequestParam HashMap<String, Object> params) {
		
		return service.reviewMemberList(cri, params);
	}
	
	// 회원 후기 블라인드
	@RequestMapping(value = "/blindMember.do")
	public String blindMember(HttpSession session,
			@RequestParam HashMap<String, String> params) {
		String loginId = (String)session.getAttribute("loginId");
		params.put("mb_id", loginId);
		params.put("relation", "cp_member_review");
		
		logger.info("params"+params);
		comService.blind(params);
		return "redirect:/reviewMemberAdmList.go";
	}
	
}
