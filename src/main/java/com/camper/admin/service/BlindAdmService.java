package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.BlindAdmDAO;
import com.camper.admin.dto.BlindAdmDTO;

@Service
public class BlindAdmService {

	@Autowired BlindAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView blindList() {
		ArrayList<BlindAdmDTO> list = dao.blindList();
		ModelAndView mav = new ModelAndView("admin/blindAdmList");
		mav.addObject("list",list);
		return mav;
	}

	public ModelAndView blindSearch(HashMap<String, String> params) {
		ArrayList<BlindAdmDTO> list = dao.blindSearch(params);
		ModelAndView mav = new ModelAndView("admin/blindAdmList");
		mav.addObject("list",list);
		return mav;
	}
	
	

}
