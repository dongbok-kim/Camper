package com.camper.profile.service;



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
	public ModelAndView profileView(HttpSession session, String mb_id) {
		String page = "profile";
		ModelAndView mav = new ModelAndView();
		ProfileDTO profileView = dao.profileView(mb_id);
		mav.addObject("profileView", profileView);
		
		
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
