package com.camper.mypage.service;

import java.util.ArrayList;
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
		MyReviewDTO dto = dao.reviewForm(idx);
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
	
	
	// 캠핑장 후기 목록
	// by.승진 2022-08-11
	public ModelAndView campingReviewList(String loginId) {
		ModelAndView mav = new ModelAndView("mypage/myCampingReview");
		ArrayList<MyReviewDTO> list = dao.campingReviewList(loginId);
		mav.addObject("list", list);
		return mav;
	}
	
	
	// 캠핑장 후기 삭제
	// by.승진 2022-08-11
	public ModelAndView campingReviewDelete(String idx, String loginId) {
		ModelAndView mav = new ModelAndView("redirect:/myCampingReview.go");
		dao.campingReviewDelete(idx, loginId);
		return mav;
	}
	
	
	// 크루원 후기 작성 페이지
	// by.승진 2022-08-11
	public ModelAndView crewReviewForm(String idx, String loginId) {
		ModelAndView mav = new ModelAndView("mypage/popupCrewReview");
		// 모임 관련 정보
		MyReviewDTO dto = dao.reviewForm(idx);
		mav.addObject("dto", dto);
		// 크루 목록
		ArrayList<MyReviewDTO> list = dao.crewList(idx, loginId);
		mav.addObject("list", list);
		return mav;
	}


	// 크루 후기 페이지 (받은 후기)
	// by.승진 2022-08-15
	public ModelAndView crewReviewR(String loginId) {
		ModelAndView mav = new ModelAndView("mypage/myCrewReviewR");
		ArrayList<MyReviewDTO> list = dao.crewReviewR(loginId);
		mav.addObject("list", list);
		return mav;
	}


	// 크루 후기 페이지 (작성 후기)
	// by.승진 2022-08-15
	public ModelAndView crewReviewW(String loginId) {
		ModelAndView mav = new ModelAndView("mypage/myCrewReviewW");
		ArrayList<MyReviewDTO> list = dao.crewReviewW(loginId);
		mav.addObject("list", list);
		return mav;
	}


	public void crewReview(String assessment, String score, String content, String loginId, String mb_id, String idx) {
		dao.crewReview(assessment, score, content, loginId, mb_id, idx);
	}


	public void crewReviewDelete(String idx, String loginId) {
		dao.crewReviewDelete(idx, loginId);
	}


	public void memberUpdate(String mb_id) {
		dao.memberUpdate(mb_id);
	}


	public String getId(String idx, String loginId) {
		return dao.getId(idx,loginId);
	}





}
