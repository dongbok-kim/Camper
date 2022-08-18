package com.camper.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.lib.utils.Criteria;
import com.camper.mypage.service.MyCrewService;

@Controller
public class MyCrewController {

	@Autowired MyCrewService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 내가 참여한 크루 목록
	// by. 승진 2022-08-09
	@RequestMapping(value = "/myCrewList.go", method = RequestMethod.GET)
	public ModelAndView myCrewWriteList(HttpSession session, @RequestParam HashMap<String, Object> params, Criteria cri) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		params.put("loginId", loginId);
		return service.myCrewList(cri,params);
	}
	
	
	// 크루인원 확정 목록
	// by. 승진 2022-08-09
	@RequestMapping(value = "/crewUpdate.go", method = RequestMethod.GET)
	public ModelAndView crewUpdateList(HttpSession session, @RequestParam String idx) {
		String loginId = (String) session.getAttribute("loginId");
		// String loginId = "jin";
		session.removeAttribute("idx");
		session.setAttribute("idx", idx);
		return service.crewUpdateList(idx);
	}
	
	
	// 크루인원 확정 하기
	// by. 승진 2022-08-10
	@RequestMapping(value = "/crewUpdate.do", method = RequestMethod.POST)
	public ModelAndView crewUpdate(HttpSession session, @RequestParam String[] crew_chk) {
		String idx = (String) session.getAttribute("idx");
		session.removeAttribute("idx");
		// 크루모집글의 캠핑 종료 여부를 1로 변경, 캠핑완료 날짜에 현재 날짜 찍기
		service.crewTogetherUpdate(idx);
		// 캠핑 참여한 회원 확정
		return service.crewUpdate(crew_chk,idx);
	}
	
	
	
}
