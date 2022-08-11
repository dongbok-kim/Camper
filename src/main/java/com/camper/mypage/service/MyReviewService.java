package com.camper.mypage.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.dao.MyReviewDAO;
import com.camper.mypage.dto.MyReviewDTO;

@Service
public class MyReviewService {

	@Autowired MyReviewDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 캠핑장 후기 작성 페이지
	// by.승진 2022-08-11
	public ModelAndView campingReviewForm(String idx, String loginId) {
		ModelAndView mav = new ModelAndView("mypage/popupCampingReview");
		MyReviewDTO dto = dao.campingReviewForm(idx);
		String nickname = dao.nickname(loginId);
		mav.addObject("dto", dto);
		mav.addObject("nickname", nickname);
		return mav;
	}

	
	// 캠핑장 후기 작성
	// by.승진 2022-08-11
	public ModelAndView campingReviewWrite(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("mypage/popupClose");
		dao.campingReviewWrite(params);
		return mav;
	}
	
	
	// 크루원 후기 작성 페이지
	// by.승진 2022-08-11
	public ModelAndView crewReviewForm(String idx, String loginId) {
		ModelAndView mav = new ModelAndView("mypage/popupCrewReview");
		return mav;
	}


}
