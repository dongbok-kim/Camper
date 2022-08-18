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
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView memberList(Model model, HttpServletRequest request, Criteria cri, @RequestParam HashMap<String, Object> params) {
		
		return service.memberAdmList(cri, params);
	}
	
	
	//회원 상세보기
	@RequestMapping(value = "/memberAdmDetail")
	public String memberAdmDetail(Model model, HttpServletRequest request, @RequestParam String mb_id) {
		
		MemberAdmDTO dto = service.memberAdmDetail(mb_id);
		model.addAttribute("dto", dto);
		
		MemberAdmDTO age = service.memberAdmAge(mb_id);
		model.addAttribute("age", age);
		
		MemberAdmDTO title = service.memberTitle(mb_id);
		model.addAttribute("title", title);
		
		return "admin/memberAdmDetail";
	}
	
	//회원 정보 수정 (일반 > 관리자)
	@RequestMapping(value = "/memberAdmUpdate.do")
	public String memberAdmUpdate(Model model, HttpServletRequest request) {
		
		String mb_id = request.getParameter("mb_id");
		logger.info("mb_id : "+mb_id);
		String mb_grade = request.getParameter("mb_graderadio");
		logger.info("mb_grade :" +mb_grade);
		
		service.memberAdmUpdate(mb_id, mb_grade);
		
		return "redirect:/memberAdmList.go";
	}
	
	
}
