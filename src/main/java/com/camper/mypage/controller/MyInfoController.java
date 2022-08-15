package com.camper.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camper.login.dto.LoginDTO;
import com.camper.mypage.dto.MyInfoDTO;
import com.camper.mypage.service.MyInfoService;

@Controller
public class MyInfoController {

	@Autowired MyInfoService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
		//내정보 수정 이동
		@RequestMapping(value = "/mypageInfo.go")
		public String loginPage(Model model, 
		HttpServletRequest request, String mb_id) {
			
			HttpSession session = request.getSession();
			
			mb_id = (String) session.getAttribute("loginId");
			
			MyInfoDTO myInfo = service.myInfo(mb_id);
			
			model.addAttribute("myInfo", myInfo);
			
			return "mypage/myInfoView";
		}
		
		
		//탈퇴하기 
		@RequestMapping(value = "secession.do")
		@ResponseBody
		public ModelAndView secession(Model model, HttpSession session, HttpServletRequest request, String mb_id, String mb_pw, RedirectAttributes rttr) {
			
			mb_id = (String) session.getAttribute("loginId");
			
			mb_pw = request.getParameter("secession_pw");
			
			logger.info("mb_id : "+mb_id);
			logger.info("mb_pw : "+mb_pw);
			
			return service.secession(mb_id, mb_pw, rttr, session);
		}
		
		
		// 내정보 수정
		@RequestMapping(value = "myInfoUpdate.do")
		public String myInfoUpdate(Model model, HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {
			
			String page = "mypage/myInfoView";
			
			String mb_id = (String) session.getAttribute("loginId");
			
			String orimb_pw = request.getParameter("orimb_pw");
			logger.info("내가 입력한 비밀번호  : "+orimb_pw);
			
			String mb_pw = request.getParameter("mb_pw");
			logger.info("원래 비밀번호 : "+mb_pw);
			
			MyInfoDTO myInfo = service.myInfo(mb_id);
			model.addAttribute("myInfo", myInfo);
			
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			boolean match = encoder.matches(orimb_pw, mb_pw); // 비밀번호 일치 여부
			logger.info("일치여부 : "+match);
			
			if(match == true) {
				model.addAttribute("msg", "비밀번호가 일치합니다.");
				
				
			} else {
				model.addAttribute("msg", "비밀번호가 일치하지 않습니다");
			}
			
			return page;
		}
	
}
