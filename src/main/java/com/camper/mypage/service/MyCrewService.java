package com.camper.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.dao.MyCrewDAO;
import com.camper.mypage.dto.MyCrewDTO;

@Service
public class MyCrewService {

	@Autowired MyCrewDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView myCrewList(String temporaryId) {
		ArrayList<MyCrewDTO> list = dao.myCrewList(temporaryId);
		logger.info("list 갯수: "+list.size());
		ModelAndView mav = new ModelAndView("mypage/myCrew");
		mav.addObject("list", list);
		return mav;
	}
	
	// 크루인원 확정 목록
	// by. 승진 2022-08-09
	public ModelAndView crewUpdateList(String idx) {
		logger.info("idx = "+idx);
		// 캠핑장명, 캠핑기간
		HashMap<String, String> info = dao.myCrewTogetherInfo(idx);
		// 크루원 목록
		ArrayList<MyCrewDTO> list = dao.crewList(idx);
		ModelAndView mav = new ModelAndView("mypage/popupCrewList");
		mav.addObject("info", info);
		mav.addObject("list", list);
		return mav;
	}

	public ModelAndView crewUpdate(String[] crew_chk, String idx) {
		for (int i = 0; i < crew_chk.length; i++) {            
			logger.info("id : "+crew_chk[i]);
			dao.crewUpdate(crew_chk[i],idx);
		}
		ModelAndView mav = new ModelAndView("mypage/popupCrewUpdate");
		return mav;
	}

	public void crewTogetherUpdate(String idx) {
		dao.crewTogetherUpdate(idx);
		
	}

}
