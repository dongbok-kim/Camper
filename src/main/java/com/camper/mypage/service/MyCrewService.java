package com.camper.mypage.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.dao.MyCrewDAO;
import com.camper.mypage.dao.MyInfoDAO;
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

}
