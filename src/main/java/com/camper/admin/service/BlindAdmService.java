package com.camper.admin.service;

import java.util.ArrayList;

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

	public ModelAndView reportList() {
		ArrayList<BlindAdmDTO> list = dao.reportList();
		ModelAndView mav = new ModelAndView("admin/blindAdmList");
		mav.addObject("list",list);
		return mav;
	}

}
