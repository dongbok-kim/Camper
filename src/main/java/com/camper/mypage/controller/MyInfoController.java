package com.camper.mypage.controller;

import java.util.HashMap;

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
			
			String mb_newpassword = request.getParameter("newpassword");
			logger.info("수정할 비밀번호 : "+mb_newpassword);
			
			String mb_nickname = request.getParameter("mb_nickname");
			logger.info("수정할 닉네임 : "+mb_nickname);
			
			String mb_email = request.getParameter("mb_email");
			logger.info("수정할 이메일 : "+mb_email);
			
			String mb_postcode = request.getParameter("mb_postcode");
			logger.info("수정할 우편번호 : "+mb_postcode);
			
			String mb_addr_default = request.getParameter("mb_addr_default");
			logger.info("수정할 일반주소 : "+mb_addr_default);
			
			String mb_addr_detail = request.getParameter("mb_addr_detail");
			logger.info("수정할 상세 주소 : "+mb_addr_detail);
			
			
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
		
		
		//이메일 중복 체크
		@RequestMapping("/myinfodoubleCheckEmail.ajax")
		@ResponseBody
		public HashMap<String, Object> doubleCheckEmail(@RequestParam String chkEmail) {
						
		logger.info("이메일 중복 체크 : "+chkEmail);
		return service.doubleCheckEmail(chkEmail);
		}
		
		
		//닉네임 중복 체크
		@RequestMapping("/myinfodoubleCheckNickname.ajax")
		@ResponseBody
		public HashMap<String, Object> doubleCheckNickname(@RequestParam String chkNickname) {
							
		logger.info("닉네임 중복 체크 : "+chkNickname);
		return service.doubleCheckNickname(chkNickname);
		}
		
		
		
		
		
	
}
