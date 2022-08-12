package com.camper.admin.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.ReviewAdmDAO;
import com.camper.admin.dto.ReviewAdmDTO;

@Service
public class ReviewAdmService {

	@Autowired ReviewAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView reviewCampList() {
		ArrayList<ReviewAdmDTO> list = dao.reviewCampList();
		ModelAndView mav = new ModelAndView("admin/reviewAdmList");
		mav.addObject("list", list);
		return mav;
	}
	
	
	
	// 회원 후기 관리	
	public ModelAndView reviewMemberList() {
		ArrayList<ReviewAdmDTO> list = dao.reviewMemberList();
		ModelAndView mav = new ModelAndView("admin/reviewMemberAdmList");
		mav.addObject("list", list);
		return mav;
	}
	

}
