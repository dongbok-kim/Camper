package com.camper.mypage.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.dao.MyChatDAO;
import com.camper.mypage.dto.MyChatDTO;

@Service
public class MyChatService {

	@Autowired MyChatDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private HttpSession session;

	public ModelAndView myChatList() {
		ModelAndView mav = new ModelAndView("mypage/myChat");
		
//		ArrayList<MyChatDTO> list = dao.myChatList((String) session.getAttribute("loginId"));
		ArrayList<MyChatDTO> list = dao.myChatList("jin");
		
		mav.addObject("listCnt", list.size());
		mav.addObject("list", list);
		return mav;
	}

}
