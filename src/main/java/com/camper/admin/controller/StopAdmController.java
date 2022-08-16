package com.camper.admin.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.service.StopAdmService;

@Controller
public class StopAdmController {

	@Autowired StopAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//정지 회원 목록
	@RequestMapping(value = "/stopAdmList", method = RequestMethod.GET)
	public ModelAndView stopAdmList() {
		
		return service.stopAdmList();
	}
	
	
	// 회원 정지 팝업
	@RequestMapping(value = "/stopPopup.go", method = RequestMethod.GET)
	public ModelAndView stopPopup(@RequestParam String mb_id) {
		return service.stopPopup(mb_id);
	}
	
}
