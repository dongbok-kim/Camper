package com.camper.mypage.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.dao.MyCampingLikeDAO;
import com.camper.mypage.dto.MyCampingLikeDTO;

@Service
public class MyCampingLikeService {

	@Autowired MyCampingLikeDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 캠핑장 찜 목록
	// by. 승진 2022-08-08
	public ModelAndView myCampingLikeList(String loginId) {
		ArrayList<MyCampingLikeDTO> list =  dao.myCampingLikeList(loginId);
		ModelAndView mav = new  ModelAndView("mypage/myCampingLike");
		mav.addObject("list", list);
		return mav;
	}

}
