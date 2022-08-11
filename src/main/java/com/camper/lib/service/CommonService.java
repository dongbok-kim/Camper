package com.camper.lib.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.lib.dao.CommonDAO;

@Service
public class CommonService {

	@Autowired CommonDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	
	// 캠핑장 찜해제
	// by. 승진 2022-08-11
	public ModelAndView campingLikeDelete(String idx, String loginId) {
		dao.campingLikeDelete(idx, loginId);
		ModelAndView mav = new  ModelAndView("redirect:/myCampingLikeList.go");
		return mav;
	}

	
	// 블라인드 등록
	// by.승진 2022-08-11
	public ModelAndView blind(String idx, String loginId) {
		dao.blind(idx, loginId);
		ModelAndView mav = new ModelAndView("redirect:/myCrewWriteList.go");
		return mav;
	}


}
