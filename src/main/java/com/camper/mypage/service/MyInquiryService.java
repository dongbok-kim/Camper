package com.camper.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.dao.MyInquiryDAO;
import com.camper.mypage.dto.MyInquiryDTO;

@Service
public class MyInquiryService {

	@Autowired MyInquiryDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 1:1 문의 목록
	// by.승진 2022-08-10
	public ModelAndView myInquiryList(String temporaryId) {
		ArrayList<MyInquiryDTO> list = dao.myInquiryList(temporaryId);
		logger.info("list 갯수 : "+list.size());
		ModelAndView mav = new ModelAndView("mypage/myInquiry");
		mav.addObject("list", list);
		return mav;
	}

	public void inquiryWrite(HashMap<String, String> params) {
		dao.inquiryWrite(params);
	}

	public ModelAndView inquiryDetail(String idx) {
		logger.info("글 상세보기 idx : "+idx);
		ModelAndView mav = new ModelAndView("mypage/myInquiryDetail");
		MyInquiryDTO dto = dao.inquiryDetail(idx);
		mav.addObject("dto", dto);
		return mav;
	}

	

}
