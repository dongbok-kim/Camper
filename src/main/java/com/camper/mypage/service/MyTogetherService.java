package com.camper.mypage.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.dao.MyInfoDAO;
import com.camper.mypage.dao.MyTogetherDAO;
import com.camper.mypage.dto.MyTogetherDTO;

@Service
public class MyTogetherService {

	@Autowired MyTogetherDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 내가 쓴 크루모집글 목록
	// by. 승진 2022-08-09
	public ModelAndView myCrewWriteList(String temporaryId) {
		ArrayList<MyTogetherDTO> list = dao.myCrewWriteList(temporaryId);
		logger.info("list 갯수: "+list.size());
		ModelAndView mav = new ModelAndView("mypage/myCrewWrite");
		mav.addObject("list", list);
		return mav;
	}
	
	// 내가 쓴 크루모집글 삭제
	// by. 승진 2022-08-09
	public ModelAndView myCrewWriteDelete(String idx, String temporaryId) {
		dao.myCrewWriteDelete(idx, temporaryId);
		ModelAndView mav = new ModelAndView("redirect:/myCrewWriteList.go");
		return mav;
	}

}
