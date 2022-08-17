package com.camper.mypage.controller;

import java.util.ArrayList;
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
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		return service.campingReviewForm(idx, loginId);
	}
	
	
	// 캠핑장 후기 작성
	// by.승진 2022-08-11
	@RequestMapping(value = "/campingReviewWrite.do", method = RequestMethod.POST)
	public ModelAndView campingReviewWrite(HttpSession session, @RequestParam HashMap<String, String> params) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		params.put("loginId", loginId);
		logger.info("params : "+ params);
		return service.campingReviewWrite(params);
	}
	
	
	// 캠핑장 후기 목록
	// by.승진 2022-08-11
	@RequestMapping(value = "/myCampingReview.go", method = RequestMethod.GET)
	public ModelAndView campingReviewList(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		return service.campingReviewList(loginId);
	}
	
	
	// 캠핑장 후기 삭제
	// by.승진 2022-08-11
	@RequestMapping(value = "/campingReviewDelete.do", method = RequestMethod.GET)
	public ModelAndView campingReviewDelete (HttpSession session, @RequestParam String idx) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		return service.campingReviewDelete(idx, loginId);
	}
	
	
	// 크루원 후기작성 페이지
	// by.승진 2022-08-11
	@RequestMapping(value = "/crewReviewForm.go", method = RequestMethod.GET)
	public ModelAndView crewReviewForm(HttpSession session, @RequestParam String idx) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		session.removeAttribute("idx");
		session.setAttribute("idx", idx);
		return service.crewReviewForm(idx, loginId);
	}
	
	
	//  크루원 후기 작성
	// by.승진 2022-08-16
	@RequestMapping(value = "/crewReview.do", method = RequestMethod.POST)
	public String crewReview(HttpSession session, @RequestParam HashMap<String, String> params) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		String idx = (String) session.getAttribute("idx");
		logger.info("크루 모집 번호는 = "+idx);
		logger.info("params : "+params);
		
		String mb_id, assessment, content, score;
		
		for (int i = 0; i < Integer.parseInt(params.get("cnt")); i++) {
			mb_id = params.get("mb_id"+i);
			assessment = params.get("assessment"+i);
			content = params.get("content"+i);
			
			if (assessment.equals("좋아요")) {
				score="2500";
			} else if (assessment.equals("보통")) {
				score="1500";
			} else {
				score="500";
			}
			
			logger.info(mb_id+" / "+assessment+" / "+score+" / "+content);
			service.crewReview(assessment, score, content, loginId,  mb_id, idx);
			// 리뷰받은 회원 모닥불온도 업데이트
			service.memberUpdate(mb_id);
		}
		
		return "mypage/popupClose";
	}
	
	
	// 크루 후기 페이지 (받은 후기)
	// by.승진 2022-08-15
	@RequestMapping(value = "/myCrewReviewR.go", method = RequestMethod.GET)
	public ModelAndView crewReviewR(HttpSession session) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		return service.crewReviewR(loginId);
	}
	
	
	// 크루 후기 페이지 (작성 후기)
	// by.승진 2022-08-15
	@RequestMapping(value = "/myCrewReviewW.go", method = RequestMethod.GET)
	public ModelAndView crewReviewW(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		return service.crewReviewW(loginId);
	}
	
	
	// 크루 후기 삭제
	// by.승진 2022-08-16
	@RequestMapping(value = "/crewReviewDelete.do", method = RequestMethod.GET)
	public String crewReviewDelete (HttpSession session, @RequestParam String idx) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		String mb_id = service.getId(idx, loginId);
		service.crewReviewDelete(idx, loginId);
		// 리뷰받은 회원 모닥불온도 업데이트
		service.memberUpdate(mb_id);
		return "redirect:/myCrewReviewW.go";
	}	
}
