package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.TitleAdmDAO;
import com.camper.admin.dto.TitleAdmDTO;

@Service
public class TitleAdmService {

	@Autowired TitleAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 타이틀 관리 목록
	// by.승진 2022-08-14
	public ModelAndView titleList() {
		ModelAndView mav = new ModelAndView("admin/titleAdmList");
		ArrayList<TitleAdmDTO> list = dao.titleList();
		mav.addObject("list", list);
		return mav;
	}

	
	// 타이틀 추가
	// by.승진 2022-08-14
	public ModelAndView titleAdd(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("redirect:/titleList.go");
		logger.info("params : "+params);
		dao.titleAdd(params);
		// 회원 테이블 업데이트
		ArrayList<TitleAdmDTO> list = dao.getTitleIdx();
		for (TitleAdmDTO dto : list) {
			logger.info("타이틀 번호 : "+dto.getMt_idx());
			dao.memberUpdate(dto.getMt_idx());
		}
		return mav;
	}


	// 타이틀 수정
	// by.승진 2022-08-14
	public ModelAndView titleUpdateForm(String idx) {
		ModelAndView mav = new ModelAndView("admin/titleAdmUpdate");
		logger.info("idx = "+idx);
		TitleAdmDTO dto = dao.titleUpdateForm(idx);
		mav.addObject("dto", dto);
		return mav;
	}

	// 타이틀 수정
	// by.승진 2022-08-14
	public ModelAndView titleUpdate(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("redirect:/titleList.go");
		dao.titleUpdate(params);
		// 회원 테이블 업데이트
		ArrayList<TitleAdmDTO> list = dao.getTitleIdx();
		for (TitleAdmDTO dto : list) {
			logger.info("타이틀 번호 : "+dto.getMt_idx());
			dao.memberUpdate(dto.getMt_idx());
		}
		return mav;
	}

}
