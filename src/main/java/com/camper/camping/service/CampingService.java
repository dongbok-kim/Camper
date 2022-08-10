package com.camper.camping.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.camping.dao.CampingDAO;
import com.camper.camping.dto.CampingDTO;


@Service
public class CampingService {

	@Autowired CampingDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView campingList(HttpSession session) {
		
		//String page = "login?";
		String page = "campingList";
		ModelAndView mav = new ModelAndView();
		ArrayList<CampingDTO> campingList = dao.campingList();	
		mav.addObject("campingList", campingList);
		
		/* 로그인 체크
		if(session.getAttribute("loginId") != null) {
			page = "campingList";
		}else {
			mav.addObject("msg","로그인이 필요한 서비스입니다.");
		}
		*/
		mav.setViewName(page);
		
		return mav;
	}

	public ModelAndView campingView(HttpSession session, String ca_idx) {
		
		//String page = "login?";
		String page = "campingView";
		ModelAndView mav = new ModelAndView();
		CampingDTO campingView = dao.campingView(ca_idx);	
		mav.addObject("campingView", campingView);
		
		CampingDTO campingView_review = dao.campingView_review(ca_idx);	
		mav.addObject("campingView_review", campingView_review);

		CampingDTO campingView_together = dao.campingView_together(ca_idx);	
		mav.addObject("campingView_together", campingView_together);
		
		/*
		if(session.getAttribute("loginId") != null) {
			page = "detail";
		}else {
			mav.addObject("msg","로그인이 필요한 서비스입니다.");
		}
		*/
		mav.setViewName(page);
		return mav;
	}

}
