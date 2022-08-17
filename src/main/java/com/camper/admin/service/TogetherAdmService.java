package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.TogetherAdmDAO;
import com.camper.admin.dto.TogetherAdmDTO;

@Service
public class TogetherAdmService {

	@Autowired TogetherAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView togetherList() {
		ArrayList<TogetherAdmDTO> list = dao.togetherList();
		ModelAndView mav = new ModelAndView("admin/togetherAdmList");
		mav.addObject("list", list);
		return mav;
	}

	public ModelAndView togetherView(int ct_idx) {
		TogetherAdmDTO dto = dao.togetherView(ct_idx);
		ModelAndView mav = new ModelAndView("admin/togetherAdmView");
		mav.addObject("dto", dto);
		
		return mav;
	}
	
	

}
