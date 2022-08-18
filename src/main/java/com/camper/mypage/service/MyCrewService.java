package com.camper.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;
import com.camper.mypage.dao.MyCrewDAO;
import com.camper.mypage.dto.MyCrewDTO;

@Service
public class MyCrewService {

	@Autowired MyCrewDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView myCrewList(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("mypage/myCrew");
		
		// 검색 연동 페이징
		cri.setAmount(15);
		
		int total = (int) dao.total(params);
		mav.addObject("listCnt", total);
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);

		int pageNum = cri.getPageNum();
		
		// 현재 페이지가 마지막 페이지를 초과하지 못하도록 방지하는 코드
		if (pageMaker.getEndPage()> 0 && pageNum > pageMaker.getEndPage()){
			pageNum = pageMaker.getEndPage();
			cri.setPageNum(pageNum);
		}
		
		// DAO MAPPER OFFSET
		int skip = (pageNum-1)*cri.getAmount();
		params.put("skip", skip);
		mav.addObject("skip", skip);
		
		// DAO MAPPER LIMIT
		params.put("amount", cri.getAmount());

		
		
		ArrayList<MyCrewDTO> list = dao.myCrewList(params);
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}
	
	// 크루인원 확정 목록
	// by. 승진 2022-08-09
	public ModelAndView crewUpdateList(String idx) {
		logger.info("idx = "+idx);
		// 캠핑장명, 캠핑기간
		HashMap<String, String> info = dao.myCrewTogetherInfo(idx);
		// 크루원 목록
		ArrayList<MyCrewDTO> list = dao.crewList(idx);
		ModelAndView mav = new ModelAndView("mypage/popupCrewList");
		mav.addObject("info", info);
		mav.addObject("list", list);
		return mav;
	}

	
	// 캠핑 참여 회원 확인
	// by.승진 2022-08-10
	public ModelAndView crewUpdate(String[] crew_chk, String idx) {
		for (int i = 0; i < crew_chk.length; i++) {            
			logger.info("id : "+crew_chk[i]);
			dao.crewUpdate(crew_chk[i],idx);
		}
		ModelAndView mav = new ModelAndView("mypage/popupClose");
		return mav;
	}

	
	// 크루모집글 캠핑완료
	// by.승진 2022-08-10
	public void crewTogetherUpdate(String idx) {
		dao.crewTogetherUpdate(idx);
		
	}

}
