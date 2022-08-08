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

	public ModelAndView myCampingLikeList(String temporaryId) {
		ArrayList<MyCampingLikeDTO> list =  dao.myCampingLikeList(temporaryId);
		logger.info("list 갯수 : "+list.size());
		int listSize = list.size();
		ModelAndView mav = new  ModelAndView("mypage/myCampingLike");
		mav.addObject("list", list);
		mav.addObject("listSize", listSize);
		return mav;
	}

	public ModelAndView myCampingLikeDelete(String idx) {
		dao.myCampingLikeDelete(idx);
		ModelAndView mav = new  ModelAndView("redirect:/myCampingLikeList.go");
		return mav;
	}

}
