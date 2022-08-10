package com.camper.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camper.mypage.service.MyInquiryService;

@Controller
public class MyInquiryController {

	@Autowired MyInquiryService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 1:1 문의 목록
	// by. 승진 2022-08-10
	@RequestMapping(value = "/myInquiryList.go", method = RequestMethod.GET)
	public ModelAndView myInquiryList(HttpSession session) {
		// String loginId = (String) session.getAttribute("loginId");
		String temporaryId = "jin";
		return service.myInquiryList(temporaryId);
	}
	
	
	// 문의글 작성 페이지
	// by. 승진 2022-08-10
	@RequestMapping(value = "/inquiryWrite.go", method = RequestMethod.GET)
	public String inquiryWriteForm(HttpSession session, Model model) {
		// String loginId = (String) session.getAttribute("loginId");
		String temporaryId = "jin";
		model.addAttribute("loginId", temporaryId);
		return "mypage/inquiryWriteForm";
	}
	
	
	// 문의글 작성
	// by. 승진 2022-08-10
	@RequestMapping(value = "/inquiryWrite.do", method = RequestMethod.POST)
	public String inquiryWrite(@RequestParam HashMap<String, String> params, Model model, RedirectAttributes rAttr) {
		logger.info("params:"+params);
		if (params.get("subject").equals("") || params.get("content").equals("")) {
			rAttr.addFlashAttribute("msg", "글쓰기에 실패했습니다.");
		} else {
			service.inquiryWrite(params);
		}
		return "redirect:/myInquiryList.go";
	}
	
	
	// 문의글 상세보기
	// by.승진 2022-08-10 
	@RequestMapping(value = "/inquiryDetail.go", method = RequestMethod.GET)
	public ModelAndView inquiryDetail(HttpSession session, @RequestParam String idx) {
		// String loginId = (String) session.getAttribute("loginId");
		String temporaryId = "jin";
		return service.inquiryDetail(idx);
	}
	
	
}
