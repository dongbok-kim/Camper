package com.camper.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.service.CampingAdmService;
import com.camper.lib.utils.Criteria;

@Controller
public class CampingAdmController {

	@Autowired CampingAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//캠핑장 목록
	// 관리자 페이지 / 캠핑장 목록
	@RequestMapping(value = "/campingAdmList.go")
	public ModelAndView campingAdmList(Criteria cri,
			@RequestParam HashMap<String, Object> params) {
			
		return service.campingAdmList(cri, params);
	}
	
	// 관리자 페이지 / 캠핑장 api 업데이트 수정 목록 보여주기 
	@RequestMapping(value = "/campingAPI.do")
	public ModelAndView campingAPI(Criteria cri,
			@RequestParam HashMap<String, Object> params) {
			
		return null;
		//return service.campingAdmList(cri, params);
	}
	
	// 관리자 페이지 / 캠핑장 상세보기
	@RequestMapping(value = "/campingAdmView.go")
	public ModelAndView campingAdmView(
			@RequestParam HashMap<String, Object> params) {
		logger.info("캠핑장 상세보기 idx : "+params);	
		return service.campingAdmView(params);
	}
	
	//관리자 페이지 / 캠핑장 수정하기
	@RequestMapping(value = "/campingAdmUpdate.do")
	public ModelAndView campingAdmUpdate(
			@RequestParam HashMap<String, Object> params) {
		logger.info("관리자 캠핑장 정보 수정 idx : "+params);	
		return service.campingAdmUpdate(params);
	}
	
}
