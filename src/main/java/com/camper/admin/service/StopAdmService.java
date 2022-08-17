package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.StopAdmDAO;
import com.camper.admin.dto.StopAdmDTO;

@Service
public class StopAdmService {

	@Autowired StopAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView stopAdmList() {
		ArrayList<StopAdmDTO> list = dao.stopList();
		ModelAndView mav = new ModelAndView("admin/stopAdmList");
		
		mav.addObject("list", list);
		return mav;
	}

	public ModelAndView stopPopup(String mb_id) {
		logger.info("회원 정지 팝업 서비스 도착");
		// 정지기록 리스트
		ArrayList<StopAdmDTO> list = dao.stopPopup(mb_id);		
		ModelAndView mav = new ModelAndView("admin/popupStopAdm");
		
		mav.addObject("list", list);
		mav.addObject("mb_id", mb_id);
		return mav;
	}

	public ModelAndView stopAdmReg(HashMap<String, String> params) {
		String mb_id = params.get("mb_id");
		ModelAndView mav = new ModelAndView("redirect:/stopPopup.go?mb_id="+mb_id);
		dao.stopAdmReg(params);
		return mav;
	}

}
