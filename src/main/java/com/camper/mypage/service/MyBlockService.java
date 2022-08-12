package com.camper.mypage.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.dao.MyBlockDAO;
import com.camper.mypage.dao.MyInfoDAO;
import com.camper.mypage.dto.MyBlockDTO;

@Service
public class MyBlockService {

	@Autowired MyBlockDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 차단한 회원 목록
	// by.승진 2022-08-12
	public ModelAndView blockList(String loginId) {
		ModelAndView mav = new ModelAndView("mypage/myBlock");
		ArrayList<MyBlockDTO> list = dao.blockList(loginId);
		mav.addObject("list", list);
		return mav;
	}

}
