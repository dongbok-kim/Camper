package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.TogetherAdmDAO;
import com.camper.admin.dto.TogetherAdmDTO;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;

@Service
public class TogetherAdmService {

	@Autowired TogetherAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 관리자/모집글 목록
	public ModelAndView togetherList(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("admin/togetherAdmList");
		
		// 검색 연동 페이징
		cri.setAmount(15);
		if (params.get("keyword") != null && !params.get("keyword").toString().trim().equals("")) {
			cri.setKeyword((String) params.get("keyword"));
			cri.setType((String) params.get("type"));
			
			// View에서 내가 선택한 옵션과 검색어를 유지시키기 위해서 다시 ModelAndView로 보낸다
			mav.addObject("keyword", (String) params.get("keyword"));
			mav.addObject("type", (String) params.get("type"));
		}
		
		int total = dao.togetherCnt(params);
		mav.addObject("listCnt", total);
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);

		int pageNum = cri.getPageNum();
		
		if (pageMaker.getStartPage() <0 ) {
			pageMaker.setStartPage(1);
		}
		
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
						
		ArrayList<TogetherAdmDTO> list = dao.togetherList(params);
		
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}
	
	
	// 관리자페이지/모집글 상세보기
	public ModelAndView togetherView(int ct_idx, Criteria cri, HashMap<String, Object> params) {

		TogetherAdmDTO dto = dao.togetherView(ct_idx);
		ModelAndView mav = new ModelAndView("admin/togetherAdmView");
		
		//페이징 정보
		String type = (String) params.get("type");
		String keyword = (String) params.get("keyword");
		String pageNum = (String) params.get("pageNum");
		
		if(type != null) {
			mav.addObject("type", type);
		}
		if(keyword != null) {
			mav.addObject("keyword", keyword);
		}
		if(pageNum != null) {
			mav.addObject("pageNum", pageNum);
		}
		mav.addObject("pageNum", pageNum);
		
		mav.addObject("dto", dto);
		
		return mav;
	}
	
	

}
