package com.camper.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.lib.service.CommonService;
import com.camper.lib.utils.Criteria;
import com.camper.mypage.service.MyBlockService;

@Controller
public class MyBlockController {

	@Autowired MyBlockService service;
	@Autowired CommonService c_service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 차단 회원 목록
	// by.승진 2022-08-12
	@RequestMapping(value = "/myBlockList.go", method = RequestMethod.GET)
	public ModelAndView blockList(HttpSession session, @RequestParam HashMap<String, Object>params, Criteria cri) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		params.put("loginId", loginId);
		return service.blockList(cri, params);
	}
	
	
	// 차단 회원 해제
	// by.승진 2022-08-12
	@RequestMapping(value = "/myBlockDelete.do", method = RequestMethod.GET)
	public String blockDelete(HttpSession session, @RequestParam String idx) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		c_service.blockDelete(idx, loginId);
		return "redirect:/myBlockList.go";
	}
		
	
	
}
