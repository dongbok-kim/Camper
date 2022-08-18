package com.camper.crew.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.camper.crew.dao.TogetherDAO;
import com.camper.crew.dto.TogetherDTO;
import com.camper.lib.dao.CommonDAO;

@Service
public class TogetherService {

	@Autowired TogetherDAO dao;
	@Autowired CommonDAO c_dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	//크루모집 리스트
	public ArrayList<TogetherDTO> list() {
		return dao.list();
	}

	//모집글 상세보기
	public TogetherDTO view(String ct_idx) {
		return dao.view(ct_idx);
	}

	//크루모집 삭제
	@Transactional
	public String crewTogetherDelete(String ct_idx, HttpSession session) {
		TogetherDTO dto = dao.view(ct_idx);
		String loginId = (String) session.getAttribute("loginId");
		int cg_idx = dto.getCg_idx();
		
		if (loginId.equals(dto.getMb_id())) {
			c_dao.blindSelf(ct_idx, loginId);
			
			dao.chatMessageDel(cg_idx);
			dao.chatJoinDel(cg_idx);
			dao.chatRoomDel(cg_idx);
		
		}
		return "redirect:/crewTogetherList.do";
		
	}

	public int crewCnt() {
		logger.info("크루목록가져오기");
		return dao.crewCnt();
	}

	public ArrayList<TogetherDTO> recom(String mb_id) {
		return dao.recom(mb_id);
	}

	public ArrayList<TogetherDTO> recom() {
		return dao.recomList();
	}



	



	


}
