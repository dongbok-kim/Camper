package com.camper.crew.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.camping.dto.CampingDTO;
import com.camper.crew.dao.TogetherDAO;
import com.camper.crew.dto.TogetherDTO;

@Service
public class TogetherService {

	@Autowired TogetherDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	//크루모집 리스트
	public ArrayList<TogetherDTO> list() {
		return dao.list();
	}

	//모집글 상세보기
	public TogetherDTO view(int ct_idx) {
		return dao.view(ct_idx);
	}

	public void crewTogetherDelete(String ct_idx) {
		dao.crewTogetherDelete(ct_idx);
		
	}

	
	
	
	
	
	
	
	
	// 모집글 - 캠핑장 검색 팝업 - 캠핑장 리스트 불러오기
	public ModelAndView campPopup() {
		// 캠핑장 리스트
		ArrayList<CampingDTO> list = dao.campPopup();
		ModelAndView mav = new ModelAndView("popupCamping");
		
		mav.addObject("list", list);
		return mav;
	}

	public ModelAndView crewRegFrom(HashMap<String, String> params) {
		
		dao.crewRegForm(params);
		//int ct_idx = dao.crewRegView();
		ModelAndView mav = new ModelAndView("crewTogetherList.do");
		//ModelAndView mav = new ModelAndView("crewTogetherView.do?ct_idx=");
		return mav;
	}



	


}
