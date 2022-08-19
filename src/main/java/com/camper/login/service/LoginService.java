package com.camper.login.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.login.dao.LoginDAO;
import com.camper.login.dto.LoginDTO;

@Service
public class LoginService {

	@Autowired LoginDAO dao;
	
	String plainText = "";
	String hashText = "";
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public String login(String id) {
		
		return dao.login(id);
	}

	public HashMap<String, Object> doubleCheckId(String chkId) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String doubleId = dao.doubleCheckId(chkId);
		logger.info("중복 아이디가 있나? "+doubleId);
		
		boolean over = doubleId == null ? false : true;
		map.put("doubleId", over);
		
		return map;
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


	public ModelAndView join(LoginDTO dto) {
		
		String mb_pw = dto.getMb_pw();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		dto.setMb_pw(encoder.encode(mb_pw));
		
		hashText = encoder.encode(mb_pw);
		
		boolean match = encoder.matches(mb_pw, hashText);
		logger.info("일치 여부 : "+match);
		
		int row = dao.join(dto);
		
		logger.info("join success : "+row);
		
		ModelAndView mav = new ModelAndView();
		String msg = "회원가입에 실패 했습니다.";
		String page = "login/join";
		
		if(row > 0) {
			msg = "회원가입에 성공 했습니다.";
			page = "login/login";
		}
		
		mav.addObject("msg", msg);
		mav.setViewName(page);
		
		return mav;
	}

	public String idFind(String name, String email) {
		
		return dao.idFind(name, email);
	}

	

	public ModelAndView pwRework(LoginDTO dto) {

		String mb_pw = dto.getMb_pw();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		dto.setMb_pw(encoder.encode(mb_pw));
		
		hashText = encoder.encode(mb_pw);
		
		boolean match = encoder.matches(mb_pw, hashText);
		logger.info("일치 여부 : "+match);
		
		int row = dao.pwRework(dto);
		
		logger.info("join success : "+row);
		
		ModelAndView mav = new ModelAndView();
		String msg = "비밀번호 변경에 실패 했습니다.";
		String page = "login/pwFind";
		
		if(row > 0) {
			msg = "비밀번호에 변경 성공 했습니다.";
			page = "login/login";
		}
		
		mav.addObject("msg", msg);
		mav.setViewName(page);
		
		return mav;
		
	}

	public String mbgrade(String id) {
		
		return dao.mbgrade(id);
	}

	public String mbstatus(String id) {
		
		return dao.mbstatus(id);
	}

	public void stopCnt() {
		
		// int Cnt = dao.stopCnt();
		// logger.info("Cnt : "+Cnt);
		logger.info("dddddddddd");
		dao.updateMbStatus();
	}

	public String idFindstatus(String name, String email) {
		
		return dao.idFindStatus(name, email);
	}

	public int pwFind(String mb_id, String mb_email) {
		
		return dao.pwFind(mb_id, mb_email);
	}

	public String pwFindstatus(String mb_id, String mb_email) {
		
		return dao.pwFindstatus(mb_id, mb_email);
	}

	


	
	
	
	
	
	

}
