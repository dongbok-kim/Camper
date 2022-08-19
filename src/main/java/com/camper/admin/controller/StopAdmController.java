package com.camper.admin.controller;

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

import com.camper.admin.service.StopAdmService;
import com.camper.lib.utils.Criteria;

@Controller
public class StopAdmController {

	@Autowired StopAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//정지 회원 목록
	@RequestMapping(value = "/stopAdmList.go", method = RequestMethod.GET)
	public ModelAndView stopAdmList(Criteria cri,
			@RequestParam HashMap<String, Object> params) {
		
		return service.stopAdmList(cri, params);
	}
	
	
	// 회원 정지 팝업
	@RequestMapping(value = "/stopPopup.go", method = RequestMethod.GET)
	public ModelAndView stopPopup(@RequestParam String mb_id) {
		return service.stopPopup(mb_id);
	}
	
	
	// 팝업 > 회원 정지 실행
	@RequestMapping(value = "/stopAdmReg.do", method = RequestMethod.POST)
	public ModelAndView stopAdmReg(HttpSession session,
			@RequestParam HashMap<String, String> params) {
		String ms_admin = (String) session.getAttribute("loginId");
		params.put("ms_admin", ms_admin);
		logger.info("팝업창/회원정지실행 컨트롤러 : "+params);

		return service.stopAdmReg(params);
	}
	
}
