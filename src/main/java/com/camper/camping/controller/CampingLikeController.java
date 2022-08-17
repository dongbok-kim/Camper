package com.camper.camping.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.camping.service.CampingLikeService;
import com.camper.lib.service.CommonService;

@Controller
public class CampingLikeController {
	
	@Autowired CampingLikeService service;
	@Autowired CommonService commonservice;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//찜하기
	@RequestMapping (value = "/campingLike.do")
    public ModelAndView campingLike(HttpSession session, @RequestParam String ca_idx) {
		String loginId = (String) session.getAttribute("loginId");
		logger.info(ca_idx + "번 요청" + loginId+ "가 찜");
	
    	return service.campingLike(loginId, ca_idx);	
    }
	
	//찜해제
	@RequestMapping (value = "/campingLikeDelete.do")
    public String campingLikeDelete(HttpSession session, @RequestParam String ca_idx) {
		String loginId = (String) session.getAttribute("loginId");
		logger.info(ca_idx + "번 요청" + loginId+ "가 찜");
	
		String clIdx = service.clIdx(ca_idx, loginId);
		logger.info("clIdx : " + clIdx);
    	commonservice.campingLikeDelete(clIdx, loginId);	
    	return "redirect:/campingView.go?ca_idx="+ca_idx;
    }
	
}
