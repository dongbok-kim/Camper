package com.camper.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.service.AnswerAdmService;
import com.camper.lib.utils.Criteria;

@Controller
public class AnswerAdmController {

	@Autowired AnswerAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//문의글 목록
	@RequestMapping(value = "/answerAdmList.go")
	public ModelAndView answerAdmList(Criteria cri, 
			@RequestParam HashMap<String, Object> params) {
			
		return service.answerList(cri, params);
	}
	
	// 문의글 상세보기
	@RequestMapping(value = "/answerAdmView")
	public ModelAndView answerAdmView(@RequestParam int in_idx, Criteria cri, 
			@RequestParam HashMap<String, Object> params) {
			
		return service.answerView(in_idx, cri, params);
	}
	
	// 문의글 답변 등록하기
	@RequestMapping(value = "/answerReg.do")
	public String answerReg(@RequestParam HashMap<String, String> params,
			HttpSession session) {
		logger.info("params : "+ params);
		return service.answerReg(params, session);
	}
	
}
