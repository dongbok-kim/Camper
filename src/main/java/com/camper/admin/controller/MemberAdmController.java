package com.camper.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camper.admin.dto.MemberAdmDTO;
import com.camper.admin.service.MemberAdmService;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;



@Controller
public class MemberAdmController {

	@Autowired MemberAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//회원 리스트
	@RequestMapping(value = "/memberAdmList.go")
	public String memberList(Model model, HttpServletRequest request, Criteria cri, @RequestParam HashMap<String, Object> params) {
		
		cri.setAmount(15);
		if(params.get("keyword") != null && !params.get("keyword").toString().trim().equals("")) {
			cri.setKeyword((String) params.get("keyword"));
			cri.setType((String) params.get("type"));
			
			
			model.addAttribute("keyword", params.get("keyword"));
			model.addAttribute("type", params.get("type"));
		}
		
		int total = service.memberTotal(params);
		model.addAttribute("listCnt", total);
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
		
		int pageNum = cri.getPageNum();
		
		//현재 페이지가 마지막 페이지를 초과하지 못하도록 방지하는 코드
		if(pageMaker.getEndPage() > 0 && pageNum > pageMaker.getEndPage()) {
			pageNum = pageMaker.getEndPage();
			cri.setPageNum(pageNum);
				}
				
		//DAO MAPPER OFFSET
		int skip = (pageNum - 1) * cri.getAmount();
			params.put("skip", skip);
			model.addAttribute("skip", skip);
				
		//DAO MAPPER LIMIT
		params.put("amount", cri.getAmount());
				
		
		ArrayList<MemberAdmDTO> list = service.memberAdmList(params);
		logger.info("list 갯수 : "+list.size());
		model.addAttribute("list", list);
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/memberAdmList";
	}
	
	//회원 상세보기
	@RequestMapping(value = "/memberAdmDetail")
	public String memberAdmDetail(Model model, HttpServletRequest request, @RequestParam String mb_id) {
		
		MemberAdmDTO dto = service.memberAdmDetail(mb_id);
		model.addAttribute("dto", dto);
		return "admin/memberAdmDetail";
	}
	
	
	
	
}
