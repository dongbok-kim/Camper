package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.MemberAdmDAO;
import com.camper.admin.dto.MemberAdmDTO;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;

@Service
public class MemberAdmService {

	@Autowired MemberAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public MemberAdmDTO memberAdmDetail(String mb_id) {
		
		return dao.memberAdmDetail(mb_id);
	}

	public int memberTotal(HashMap<String, Object> params) {
		
		return dao.memberTotal(params);
	}

	public ModelAndView memberAdmList(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("admin/memberAdmList");
		
		cri.setAmount(15);
		if(params.get("keyword") != null && !params.get("keyword").toString().trim().equals("")) {
			cri.setKeyword((String) params.get("keyword"));
			cri.setType((String) params.get("type"));
			
			
			mav.addObject("keyword", params.get("keyword"));
			mav.addObject("type", params.get("type"));
		}
		mav.addObject("filter", params.get("filter"));
		
		int total = dao.memberTotal(params);
		mav.addObject("listCnt", total);
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
		
		int pageNum = cri.getPageNum();
		
		if (pageMaker.getStartPage() <0 ) {
			pageMaker.setStartPage(1);
		}
		
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
				
		
		ArrayList<MemberAdmDTO> list = dao.memberAdmList(params);
		logger.info("list 갯수 : "+list.size());
		mav.addObject("list", list);
		
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}

	public void memberAdmUpdate(String mb_id, String mb_grade) {
		dao.memberAdmUpdate(mb_id, mb_grade);
		
	}

	public MemberAdmDTO memberAdmAge(String mb_id) {
		
		return dao.memberAdmAge(mb_id);
	}

	public MemberAdmDTO memberTitle(String mb_id) {
		
		return dao.memberAdmTitle(mb_id);
	}

	
	

}
