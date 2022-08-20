package com.camper.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camper.admin.service.TitleAdmService;
import com.camper.lib.utils.Criteria;

@Controller
public class TitleAdmController {

	@Autowired TitleAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 타이틀 관리 목록
	// by.승진 2022-08-14
	@RequestMapping(value = "/titleList.go", method = RequestMethod.GET)
	public ModelAndView titleList(@RequestParam HashMap<String, Object> params, Criteria cri) {
		return service.titleList(cri, params);
	}
	
	
	// 타이틀 추가 페이지
	// by.승진 2022-08-14
	@RequestMapping(value = "/titleAdd.go", method = RequestMethod.GET)
	public String titleAddForm() {
		return "admin/titleAdmAdd";
	}
	
	
	// 타이틀 추가
	// by.승진 2022-08-14
	@RequestMapping(value = "/titleAdd.do", method = RequestMethod.POST)
	public String titleAdd(@RequestParam HashMap<String, String> params, RedirectAttributes rAttr) {
		
		String page = null;
		
		// 타이틀 중복 검사
		int chkDuple = service.chkDuple(params);
		if (chkDuple != 0) {
			rAttr.addFlashAttribute("msg", "이미 등록된 타이틀이 있습니다.");
			page  = "redirect:/titleAdd.go";
		} else {
			service.titleAdd(params);
			page = "redirect:/titleList.go";
		}
		
		return page;
	}
	
	
	// 타이틀 수정 페이지
	// by.승진 2022-08-14
	@RequestMapping(value = "/titleUpdate.go", method = RequestMethod.GET)
	public ModelAndView titleUpdateForm(@RequestParam String idx) {
		return service.titleUpdateForm(idx);
	}
	
	
	// 타이틀 수정
	// by.승진 2022-08-14
	@RequestMapping(value = "titleUpdate.do", method = RequestMethod.POST)
	public String titleUpdate(@RequestParam HashMap<String, String> params, RedirectAttributes rAttr) {
		
		String page = null;
		logger.info("수정 요청 = "+params);
		// 타이틀 중복 검사
		int chkDuple = service.chkUpdateDuple(params);
		if (chkDuple != 0) {
			rAttr.addFlashAttribute("msg", "이미 등록된 타이틀이 있습니다.");
			page  = "redirect:/titleUpdate.go?idx="+params.get("mt_idx");
		} else {
			service.titleUpdate(params);
			page = "redirect:/titleList.go";
		}
		
		return page;
	}
	
}
