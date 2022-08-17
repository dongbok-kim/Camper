package com.camper.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.lib.service.CommonService;
import com.camper.lib.utils.Criteria;
import com.camper.mypage.service.MyCampingLikeService;

@Controller
public class MyCampingLikeController {

	@Autowired MyCampingLikeService service;
	@Autowired CommonService c_service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 캠핑장 찜 목록
	// by. 승진 2022-08-08
	@RequestMapping(value = "/myCampingLikeList.go", method = RequestMethod.GET)
	public ModelAndView myCampingLikeList(HttpSession session, @RequestParam HashMap<String, Object> params, Criteria cri) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		params.put("loginId", loginId);
		return service.myCampingLikeList(cri, params);
	}
	
	// 캠핑장 찜해제
	// by. 승진 2022-08-08
	@RequestMapping(value = "/myCampingLikeDelete.do", method = RequestMethod.GET)
	public String myCampingLikeDelete(HttpSession session, @RequestParam String idx) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		c_service.campingLikeDelete(idx, loginId);
		return "redirect:/myCampingLikeList.go";
	}
	
	
	// 캠핑장 검색
	// by.승진 2022-08-17
	@RequestMapping(value = "/myCampingLikeSearch.do", method = RequestMethod.POST)
	public ModelAndView myCampingLikeSearch(HttpSession session, @RequestParam HashMap<String, Object> params, Criteria cri) {
	String loginId = (String) session.getAttribute("loginId");
	// String loginId = "jin";
	params.put("loginId", loginId);
	logger.info("params = "+params);
	return service.myCampingLikeSearch(cri, params);
	}
	
}
