package com.camper.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;

import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;
import com.camper.mypage.dao.MyInquiryDAO;
import com.camper.mypage.dto.MyInquiryDTO;

@Service
public class MyInquiryService {

	@Autowired MyInquiryDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 1:1 문의 목록
	// by.승진 2022-08-10
	public ModelAndView myInquiryList(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("mypage/myInquiry");
		
		// 검색 연동 페이징
		cri.setAmount(15);
		if (params.get("keyword") != null && !params.get("keyword").toString().trim().equals("")) {
			cri.setKeyword((String) params.get("keyword"));
			cri.setType((String) params.get("type"));
			
			// View에서 내가 선택한 옵션과 검색어를 유지시키기 위해서 다시 ModelAndView로 보낸다
			mav.addObject("keyword", (String) params.get("keyword"));
			mav.addObject("type", (String) params.get("type"));
		}
		
		int total = dao.total(params);
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
		
		
		ArrayList<MyInquiryDTO> list = dao.myInquiryList(params);
		
		mav.addObject("list", list);
		
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}

	public void inquiryWrite(HashMap<String, String> params) {
		dao.inquiryWrite(params);
	}

	public ModelAndView inquiryDetail(String idx, String loginId, HashMap<String, Object> params) {
		logger.info("글 상세보기 idx : "+idx);
		ModelAndView mav = new ModelAndView("mypage/myInquiryDetail");
		MyInquiryDTO dto = dao.inquiryDetail(idx);
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
		if (!dto.getMb_id().equals(loginId)) {
			logger.info(dto.getMb_id()+" / "+loginId);
			mav.setViewName("redirect:/myInquiryList.go");
		} else {
			mav.addObject("dto", dto);			
		}
		return mav;
	}

	// 문의글 삭제
	// by.승진 2022-08-10
	public ModelAndView myInquiryDelete(String idx, String loginId) {
		ModelAndView mav = new ModelAndView("redirect:/myInquiryList.go");
		dao.myInquiryDelete(idx, loginId);
		return mav;
	}

	// 문의글 수정 페이지
	// by.승진 2022-08-11
	public ModelAndView myInquiryUpdateForm(String idx, String loginId) {
		ModelAndView mav = new ModelAndView("mypage/myInquiryUpdate");
		MyInquiryDTO dto = dao.myInquiryUpdateForm(idx);
		if (!dto.getMb_id().equals(loginId)) {
			logger.info(dto.getMb_id()+" / "+loginId);
			mav.setViewName("redirect:/myInquiryList.go");
		} else {
			mav.addObject("dto", dto);			
		}
		return mav;
	}

	public void myInquiryUpdate(HashMap<String, String> params) {
		dao.myInquiryUpdate(params);
	}

	

}
