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
		session.removeAttribute("idx");
		session.setAttribute("idx", idx);
		return service.crewReviewForm(idx, loginId);
	}
	
	
	@RequestMapping(value = "/crewReview.do", method = RequestMethod.POST)
	public ModelAndView crewReview(HttpSession session, @RequestParam HashMap<String, String> params) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		String idx = (String) session.getAttribute("idx");
		logger.info("크루 모집 번호는 = "+idx);
		logger.info("params : "+params);
		
		ArrayList<String> list = new ArrayList<String>();

		for (Entry<String, String> entry: params.entrySet()) {
			logger.info("key : "+entry.getKey()+"value : "+entry.getValue());
			
			if (entry.getKey().contains("assessment")) {
				// 키 값 가져오기
				String id = entry.getKey();
				logger.info(id);
				
				// 키 값에서 아이디 추출
				String getId = id.substring(11, id.length()-1);
				logger.info(getId);
				
				list.add(idx);
				list.add(getId);
				// 평가 항목(싫어요, 보통, 좋아요)
				list.add(entry.getValue());

			} else if (entry.getKey().contains("content")){
				String content = entry.getValue();
				list.add(content);
			}
			
			logger.info("리스트는 : "+list);
			
			String[] result = list.toArray(new String[0]);
			
			for (int i = 0; i < result.length; i++) {
				logger.info("result : "+result[i]);
			}
			
		}
		

		
		
		return null;
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
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jin";
		return service.crewReviewW(loginId);
	}
}
