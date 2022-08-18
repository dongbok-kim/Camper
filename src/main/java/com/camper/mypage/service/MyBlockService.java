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
import com.camper.mypage.dao.MyBlockDAO;
import com.camper.mypage.dto.MyBlockDTO;

@Service
public class MyBlockService {

	@Autowired MyBlockDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 차단한 회원 목록
	// by.승진 2022-08-12
	public ModelAndView blockList(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("mypage/myBlock");
		
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

		
		ArrayList<MyBlockDTO> list = dao.blockList(params);
		mav.addObject("list", list);
		return mav;
	}

}
