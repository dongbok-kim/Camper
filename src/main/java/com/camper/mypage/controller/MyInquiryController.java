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

import com.camper.lib.utils.Criteria;
import com.camper.mypage.service.MyInquiryService;

@Controller
public class MyInquiryController {

	@Autowired MyInquiryService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 1:1 문의 목록
	// by. 승진 2022-08-10
	@RequestMapping(value = "/myInquiryList.go", method = RequestMethod.GET)
	public ModelAndView myInquiryList(HttpSession session, @RequestParam HashMap<String, Object> params, Criteria cri) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		params.put("loginId", loginId);
		return service.myInquiryList(cri, params);
	}
	
	
	// 문의글 작성 페이지
	// by. 승진 2022-08-10
	@RequestMapping(value = "/inquiryWrite.go", method = RequestMethod.GET)
	public String inquiryWriteForm(HttpSession session, Model model) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		model.addAttribute("loginId", loginId);
		return "mypage/myInquiryWriteForm";
	}
	
	
	// 문의글 작성
	// by. 승진 2022-08-10
	@RequestMapping(value = "/inquiryWrite.do", method = RequestMethod.POST)
	public String inquiryWrite(@RequestParam HashMap<String, String> params, RedirectAttributes rAttr) {
		logger.info("params:"+params);
		if (params.get("subject").trim().equals("")) {
			rAttr.addFlashAttribute("msg", "제목을 입력하세요");
		} else if (params.get("content").trim().equals("")) {
			rAttr.addFlashAttribute("msg", "내용을 입력하세요.");
		}	else {
			service.inquiryWrite(params);
		}
		return "redirect:/myInquiryList.go";
	}
	
	
	// 문의글 상세보기
	// by.승진 2022-08-10 
	@RequestMapping(value = "/inquiryDetail.go", method = RequestMethod.GET)
	public ModelAndView inquiryDetail(HttpSession session,@RequestParam String idx,  @RequestParam HashMap<String, Object> params) {
		String loginId = (String) session.getAttribute("loginId");
		params.put("loginId", loginId);
		
		// String loginId = "jin";
		return service.inquiryDetail(idx, loginId, params);
	}
	
	
	// 문의글 삭제
	// by.승진 2022-08-10
	@RequestMapping(value = "/myInquiryDelete.do", method = RequestMethod.GET)
	public ModelAndView myInquiryDelete(HttpSession session, @RequestParam String idx) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		return service.myInquiryDelete(idx, loginId);
	}
	
	
	// 문의글 수정
	// by.승진 2022-08-11
	@RequestMapping(value = "/myInquiryUpdate.go", method = RequestMethod.GET)
	public ModelAndView myInquiryUpdateForm(HttpSession session, @RequestParam String idx) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		return service.myInquiryUpdateForm(idx, loginId);
	}
	
	
	// 문의글 수정
	// by. 승진 2022-08-11
	@RequestMapping(value = "/myInquiryUpdate.do", method = RequestMethod.POST)
	public String myInquiryUpdate(@RequestParam HashMap<String, String> params, RedirectAttributes rAttr) {
		logger.info("params:"+params);
		if (params.get("subject").trim().equals("")) {
			rAttr.addFlashAttribute("msg", "제목을 입력하세요.");
		} else if (params.get("content").trim().equals("")) {
			rAttr.addFlashAttribute("msg", "내용을 입력하세요");
		} else {
			service.myInquiryUpdate(params);
		}
		return "redirect:/inquiryDetail.go?idx="+params.get("idx");
	}
	
	
}
