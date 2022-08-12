package com.camper.profile.controller;


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


import com.camper.profile.service.ProfileService;

@Controller
public class ProfileController {

	@Autowired ProfileService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
		
	//회원 프로필 불러오기
	@RequestMapping (value = "/profile", method = RequestMethod.GET)
    public ModelAndView profileView(HttpSession session, @RequestParam String mb_id) {
		logger.info(mb_id + "프로필 요청");
		//String loginId = (String) session.getAttribute("loginId");로그인한 아이디
		String loginId= "uihwan91";	
    	return service.profileView(loginId, mb_id);	
    }
		
	
	//차단하기
	@RequestMapping(value = "/MemberBlock.do", method = RequestMethod.GET)
	public ModelAndView MemberBlock(HttpSession session, @RequestParam String mb_id) {
		logger.info("차단 요청" + mb_id);
		//String loginId = (String) session.getAttribute("loginId");로그인한 아이디
		String loginId= "uihwan91";		
		return service.MemberBlock(mb_id, loginId);
		
	}
	
	
	
	//차단해제
		@RequestMapping(value = "/MemberBlockDelete.do", method = RequestMethod.GET)
		public ModelAndView MemberBlockDelete(HttpSession session, @RequestParam String mb_id) {
			logger.info("차단 해제" + mb_id);
			//String loginId = (String) session.getAttribute("loginId");로그인한 아이디
			String loginId= "uihwan91";
			logger.info("확인용" + mb_id + loginId);
			return service.MemberBlockDelete(mb_id, loginId);
			
		}
	
}
