package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.AnswerAdmDAO;
import com.camper.admin.dto.AnswerAdmDTO;

@Service
public class AnswerAdmService {

	@Autowired AnswerAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 문의글 목록
	public ModelAndView answerList() {
		ArrayList<AnswerAdmDTO> list = dao.answerList();
		ModelAndView mav = new ModelAndView("admin/answerAdmList");
		
		mav.addObject("list",list);
		return mav;
	}
	
	// 문의글 상세보기
	public ModelAndView answerView(int in_idx) {
		AnswerAdmDTO dto = dao.answerView(in_idx);
		ModelAndView mav = new ModelAndView("admin/answerAdmView");
		
		mav.addObject("answer", dto);
		return mav;
	}
	
	// 답변글 등록
	public String answerReg(HashMap<String, String> params, HttpSession session) {
		String status = params.get("in_status");
		//String ia_admin = (String) session.getAttribute("loginId"); // 답변 작성 관리자
		String ia_admin = "ryu"; // 임시 답변 관리자 아이디
		String idx = params.get("in_idx");
		
		if(status.equals("처리중")) {
			logger.info("처리중");
			dao.updateStatus(params); //
		} else { // 답변내용 작성했으나 답변상태를 변경하지 않은 경우 포함하기 위함
			logger.info("답변완료");
			params.put("in_status", "답변완료");
			params.put("ia_admin", ia_admin);
			dao.updateStatus(params);
			dao.answerReg(params);
		}
		return "redirect:/answerAdmView?in_idx="+idx;
	}

}
