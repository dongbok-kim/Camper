package com.camper.login.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.login.dao.LoginDAO;
import com.camper.login.dto.LoginDTO;

@Service
public class LoginService {

	@Autowired LoginDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public String login(String id, String pw) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	

}
