package com.camper.mypage.service;

import java.util.HashMap;

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

	public HashMap<String, Object> doubleCheckEmail(String chkEmail) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String doubleEmail = dao.doubleCheckEmail(chkEmail);
		
		logger.info("중복 이메일이 있나? "+doubleEmail);
		boolean over = doubleEmail == null ? false : true;
		
		map.put("doubleEmail", over);
		
		return map;
	}

	public HashMap<String, Object> doubleCheckNickname(String chkNickname) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String doubleNickname = dao.doubleCheckNickname(chkNickname);
		logger.info("중복 닉네임이 있나? "+doubleNickname);
		
		boolean over = doubleNickname == null ? false : true;
		map.put("doubleNickname", over);
		
		return map;
	}

	public void myInfoUpdate(String mb_id, String mb_newpassword, String mb_nickname, String mb_email,
			String mb_postcode, String mb_addr_default, String mb_addr_detail, String ma_idx, String mb_sido, String mb_sigungu) {
		
		MyInfoDTO myInfo = new MyInfoDTO();
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		 dao.myInfoUpdate(mb_id, mb_nickname, mb_email,
				mb_postcode, mb_addr_default, mb_addr_detail, ma_idx, mb_sido,
				mb_sigungu, encoder.encode(mb_newpassword));
		// myInfo.setMb_pw(encoder.encode(mb_newpassword));
	}

	public void myInfoUpdateTwo(String mb_id, String mb_nickname, String mb_email, String mb_postcode,
			String mb_addr_default, String mb_addr_detail, String ma_idx, String mb_sido, String mb_sigungu) {
		
		dao.myInfoUpdateTwo(mb_id, mb_nickname, mb_email, mb_postcode,
				mb_addr_default, mb_addr_detail, ma_idx, mb_sido, mb_sigungu);
		
	}


}
