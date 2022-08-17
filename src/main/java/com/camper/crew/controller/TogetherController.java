package com.camper.crew.controller;

import java.util.ArrayList;
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

import com.camper.crew.dto.TogetherDTO;
import com.camper.crew.service.TogetherService;

@Controller
public class TogetherController {

	@Autowired TogetherService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//크루모집 목록
	@RequestMapping(value = "/crewTogetherList.do")
	public String crewTogetherList (Model model) {
		String page="crewTogetherList";
		
		ArrayList<TogetherDTO>list=service.list();
		model.addAttribute("list",list);
		
		return page;
	}
	
	
	//크루모집 상세보기
	@RequestMapping(value="/crewTogetherView.do")
	public String crewTogetherView(@RequestParam int ct_idx, Model model) {
		String page = "crewTogetherView";
		logger.info(ct_idx+"번 크루모집 상세보기");
		
		TogetherDTO dto=service.view(ct_idx);
		model.addAttribute("cct",dto);
		
		return page;
			
	}
	
	//크루추천
	@RequestMapping(value="/crewTogetherRecommend.go")
	public String crewTogetherRecommend (Model model) {
		String page ="crewTogetherRecommend";
		
		ArrayList<TogetherDTO>list=service.list();
		return page;
		
	}
	
	//모집삭제하기
	@RequestMapping (value="/crewTogetherDelete.do")
	public String delete(Model model, @RequestParam String ct_idx) {
		service.crewTogetherDelete(ct_idx);
		return "redirect:/crewTogetherList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 크루 모집글 이동
		@RequestMapping (value="/togetherCrewReg.go")
		public String crewReg() {
			
			return "togetherCrewReg";
		}
	
	
	// 크루 모집글 작성 - 캠핑장 검색 팝업
	@RequestMapping (value="/campPopup.go")
	public ModelAndView campPopup() {
		
		return service.campPopup();
	}
	
	
	// 크루 모집글 작성 하기
	@RequestMapping (value="/crewReg.do")
	public ModelAndView crewRegForm(HttpSession session,
			@RequestParam HashMap<String, String> params) {
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = "jyr";
		params.put("loginId", loginId);
				
		logger.info("params : "+params);
		return null;
		//return service.crewRegFrom(params);
	}
	
}
