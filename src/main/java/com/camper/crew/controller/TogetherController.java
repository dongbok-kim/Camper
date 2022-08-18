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
	public String crewTogetherList (Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		
		ArrayList<TogetherDTO> recom;
		
		if(loginId != null) {
			recom = service.recom(loginId);
		} else {
			recom = service.recom();
		}
		
		model.addAttribute("recomList",recom);	//크루추천
		
		String page="crewTogetherList";
		int crewCnt = service.crewCnt();
		ArrayList<TogetherDTO>list=service.list();
		model.addAttribute("list",list);
		model.addAttribute("crewCnt", crewCnt);
		
		return page;
	}
	
	
	//크루모집 상세보기
	@RequestMapping(value="/crewTogetherView.do")
	public String crewTogetherView(@RequestParam String ct_idx, Model model) {
		String page = "crewTogetherView";
		logger.info(ct_idx+"번 크루모집 상세보기");
		
		TogetherDTO dto=service.view(ct_idx);
		model.addAttribute("cct",dto);
		
		return page;
			
	}
	
	

	//모집삭제하기
	@RequestMapping (value="/crewTogetherDelete.do")
	public String delete(Model model, @RequestParam String ct_idx, HttpSession session) {
		logger.info("삭제요청:"+ct_idx);
		return service.crewTogetherDelete(ct_idx, session);
	}
	
	
	/*
	//크루추천
	@RequestMapping(value="/crewTogetherRecommend.go")
	public String crewTogetherRecommend (Model model, Criteria cri, HashMap<String, Object>params) {
		String page ="crewTogetherRecommend";
		if(params.get("keyword")!= null&& !params.get("keyword").toString().trim().equals("")) {
			cri.setKeyword(String)params.get("keyword");
			cri.setType(String) params.get("type"));
			
			mav.addObject("keyword", params.get("keyword"));
			mav.addObject("type",params.get("type"));
		}
		
		int recommTotal = dao.total(params);
		mav.addObject("listCnt",total);
		
		PageMakerDTO pageMakerDTO = new PageMakerDTO(cri, total);
		
		int pageNum = cri.getPageNum();
		
		//현재 페이지가 마지막페이지를 초과하지 못하도혹 방지하는 코드
		if(pageMaker.getEndPage() > 0 && pageNum > pageMaker.getEndpage()) {
			pageNum=pageMaker.getEndPage();
			cri.setPageNum(pageNum);
		}
		//DAO MAPPER OFFSET
		int skip = (pageNum -1) * cri.getAmount();
		params.put("skip", skip);
		mav.addObject("skip",skip);
		
		//DAO MAPPER LIMIT
		params.put("amount",cri.getAmount());
		
		ArrayList<TogetherDTO>list=service.list();
		
		
		return page;
		
	}
	 */
	
	
			
			
		

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
