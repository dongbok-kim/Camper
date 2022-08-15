package com.camper.mypage.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camper.mypage.dao.MyInfoDAO;
import com.camper.mypage.dto.MyInfoDTO;

@Service
public class MyInfoService {

	@Autowired MyInfoDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public MyInfoDTO myInfo(String mb_id) {
		
		return dao.myInfo(mb_id);
	}

	public ModelAndView secession(String mb_id, String mb_pw, RedirectAttributes rttr, HttpSession session) {
		
		String msg = "비밀번호가 일치하지 않습니다 .";
		
		String page = "redirect:/mypageInfo.go";
		
		ModelAndView mav = new ModelAndView();
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String loginPw = dao.login(mb_id); //로그인한 아이디의 암호화된 비밀번호 확인
		boolean match = encoder.matches(mb_pw, loginPw); // 비밀번호 일치 여부
		
		logger.info("일치여부 : "+match);
		
		if(match == true) {
			
			dao.secession(mb_id);
			session.removeAttribute("loginId");
			session.removeAttribute("mb_grade");
			session.removeAttribute("mb_status");
			msg = "탈퇴되었습니다.";
			rttr.addFlashAttribute("msg", msg);	
			page = "redirect:/login.go";
		} else {
			rttr.addFlashAttribute("msg", msg);		// redirect 로 메시지 보내기
			page = "redirect:/mypageInfo.go";
		}
		
		mav.setViewName(page);
		// mav.addObject("msg", msg);
					
		return mav;
	}


}
