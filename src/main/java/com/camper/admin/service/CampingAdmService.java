package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.CampingAdmDAO;
import com.camper.admin.dto.CampingAdmDTO;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;

@Service
public class CampingAdmService {

	@Autowired CampingAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 관리자 페이지 / 캠핑장 목록
	public ModelAndView campingAdmList(Criteria cri,
			HashMap<String, Object> params) {
		
		ModelAndView mav = new ModelAndView("admin/campingAdmList");
		
		cri.setAmount(15);
		if(params.get("keyword") != null && !params.get("keyword").toString().trim().equals("")) {
			cri.setKeyword((String) params.get("keyword"));
			cri.setType((String) params.get("type"));
			
			//View에서 내가 선택한 옵션과 검색어를 유지시키기 위해서 다시 ModelAndView로 보낸다
			mav.addObject("keyword", params.get("keyword"));
			mav.addObject("type", params.get("type"));
		}
		
		int total = dao.campingTotal(params);
		mav.addObject("listCnt", total);
		
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
		mav.addObject("skip", skip);
		
		//DAO MAPPER LIMIT
		params.put("amount", cri.getAmount());
		
		ArrayList<CampingAdmDTO> list = dao.campingAdmList(params);
		mav.addObject("list",list);
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}

}
