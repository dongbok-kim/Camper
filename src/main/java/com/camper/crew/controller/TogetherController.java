package com.camper.crew.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// =================== 소스트리 충돌 방지 ====================================
	// 지윤 : 크루 모집글 작성, 수정
	// 크루 모집글 이동
	@RequestMapping (value="/crewTogetherReg.go")
	public String crewReg() {
		
		return "crewTogetherReg";
	}
	
	
	// 크루 모집글 작성 - 캠핑장 검색 팝업
	@RequestMapping (value="/campPopup.go")
	public ModelAndView campPopup() {
		
		return service.campPopup();
	}
	
	
	// 크루 모집글 작성 하기
	@RequestMapping (value="/crewReg.do")
	public ModelAndView crewRegForm(HttpSession session,
			@ModelAttribute TogetherDTO dto,
			@RequestParam(value="ct_camping_type") String[] campingArr) {
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = "jyr";
		dto.setMb_id(loginId);
		
		// campingType 배열에서 꺼내서 params에 콤마로 구분해서 담기
		String campingType = "";
		if(campingArr.length == 1) {
			dto.setCt_camping_type(campingArr[0]);
		} else {
			campingType = campingArr[0];
			for (int i = 1; i < campingArr.length; i++) {
				campingType += ','+campingArr[i];
			}
			dto.setCt_camping_type(campingType);
		}
		
		logger.info("크루 모집글 작성 제목 : "+ dto.getCt_title());
		//return null;
		return service.crewRegFrom(dto);
	}
	
	
	// 크루 모집글 수정 데이터 불러오기
	@RequestMapping (value="/crewTogetherUpdate.go")
	public ModelAndView crewUpdate(@RequestParam int ct_idx) {
		logger.info("모집글 수정 컨트롤러");
		return service.crewUpdate(ct_idx);
	}
	
	// 크루 모집글 수정 하기
	@RequestMapping (value="/crewTogetherUpdate.do")
	public ModelAndView crewUpdateForm(HttpSession session,
			@ModelAttribute TogetherDTO dto, 
			@RequestParam(value="ct_camping_type") String[] campingArr) {
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = "jyr";
		dto.setMb_id(loginId);
		
		// campingType 배열에서 꺼내서 params에 콤마로 구분해서 담기
		String campingType = "";
		if(campingArr.length == 1) {
			dto.setCt_camping_type(campingArr[0]);
		} else {
			campingType = campingArr[0];
			for (int i = 1; i < campingArr.length; i++) {
				campingType += ','+campingArr[i];
			}
			dto.setCt_camping_type(campingType);
		}
		
		logger.info("크루 모집글 작성 제목 : "+ dto.getCt_title());
		//return null;
		return service.crewUpdateFrom(dto);
	}
	
	
	// 크루 모집글 / 캠핑장 팝업 / 검색
	/*
	 * @RequestMapping (value="/crewTogetherUpdate.go") public ModelAndView
	 * crewUpdate(@RequestParam int ct_idx) { logger.info("모집글 수정 컨트롤러"); return
	 * service.crewUpdate(ct_idx); }
	 */
	
}
