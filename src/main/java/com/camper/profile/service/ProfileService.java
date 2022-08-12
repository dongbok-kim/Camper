package com.camper.profile.service;



import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.profile.dao.ProfileDAO;
import com.camper.profile.dto.ProfileDTO;

@Service
public class ProfileService {

	@Autowired ProfileDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());



	//프로필 조회
	public ModelAndView profileView(String loginId, String mb_id) {
		String page = "profile";
		ModelAndView mav = new ModelAndView();
		ProfileDTO profileView = dao.profileView(mb_id);
		ArrayList<ProfileDTO>profileTogether = dao.profileTogether(mb_id);
		ArrayList<ProfileDTO>profileReview = dao.profileReview(mb_id);
		String blockCheck = dao.blockCheck(mb_id, loginId);
		
		mav.addObject("profileView", profileView); //프로필보기
		mav.addObject("blockCheck", blockCheck); //차단회원여부 확인
		mav.addObject("profileTogether", profileTogether); //프로필의 작성모집글
		mav.addObject("profileReview", profileReview); //프로필의 받은리뷰
		
		mav.setViewName(page);
		return mav;
	}

	//차단하기
	public ModelAndView MemberBlock(String mb_id, String loginId) {
		//String page = "profile";
		//ModelAndView mav = new ModelAndView();
		dao.MemberBlock(mb_id, loginId);
		ModelAndView mav = new  ModelAndView("redirect:/profile?mb_id="+mb_id);		
		
		return mav;
	}

	//차단해제
	public ModelAndView MemberBlockDelete(String mb_id, String loginId) {
		dao.MemberBlockDelete(mb_id, loginId);
		ModelAndView mav = new  ModelAndView("redirect:/profile?mb_id="+mb_id);
		return mav;
	}

}
