package com.camper.mypage.controller;

import java.util.HashMap;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.service.MyReviewService;

@Controller
public class MyReviewController {

	@Autowired MyReviewService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 캠핑장 후기작성 페이지
	// by.승진 2022-08-11
	@RequestMapping(value = "/campingReviewForm.go", method = RequestMethod.GET)
	public ModelAndView campingReviewForm(HttpSession session, @RequestParam String idx) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		return service.campingReviewForm(idx, loginId);
	}
	
	
	// 캠핑장 후기 작성
	// by.승진 2022-08-11
	@RequestMapping(value = "/campingReviewWrite.do", method = RequestMethod.POST)
	public ModelAndView campingReviewWrite(HttpSession session, @RequestParam HashMap<String, String> params) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		params.put("loginId", loginId);
		logger.info("params : "+ params);
		return service.campingReviewWrite(params);
	}
	
	
	// 캠핑장 후기 목록
	// by.승진 2022-08-11
	@RequestMapping(value = "/myCampingReview.go", method = RequestMethod.GET)
	public ModelAndView campingReviewList(HttpSession session) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		return service.campingReviewList(loginId);
	}
	
	
	// 캠핑장 후기 삭제
	// by.승진 2022-08-11
		@RequestMapping(value = "/campingReviewDelete.do", method = RequestMethod.GET)
	public ModelAndView campingReviewDelete (HttpSession session, @RequestParam String idx) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		return service.campingReviewDelete(idx, loginId);
	}
	
	
	
	
	
	
	
	
	
	
	// 크루원 후기작성
	// by.승진 2022-08-11
	@RequestMapping(value = "/crewReviewForm.go", method = RequestMethod.GET)
	public ModelAndView crewReviewForm(HttpSession session, @RequestParam String idx) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		return service.crewReviewForm(idx, loginId);
	}
	
	
	@RequestMapping(value = "/crewReview.do", method = RequestMethod.POST)
	public ModelAndView crewReview(HttpSession session, @RequestParam HashMap<String, String> params) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		logger.info("params : "+params);
		HashMap<String, String> review = new HashMap<String, String>();
		for (Entry<String, String> entry: params.entrySet()) {
			logger.info("key : "+entry.getKey()+"value : "+entry.getValue());
			if (entry.getKey().equals("ct_idx")) {
				review.put("ct_idx", entry.getValue());
			}
		}
		return null;
	}
	
}
