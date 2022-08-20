package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camper.admin.dao.TitleAdmDAO;
import com.camper.admin.dto.TitleAdmDTO;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;

@Service
public class TitleAdmService {

	@Autowired TitleAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 타이틀 관리 목록
	// by.승진 2022-08-14
	public ModelAndView titleList(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("admin/titleAdmList");
		
		// 페이징
		cri.setAmount(15);
		
		int total = (int) dao.total(params);
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
		
		ArrayList<TitleAdmDTO> list = dao.titleList();
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}

	
	// 타이틀 추가
	// by.승진 2022-08-14
	public void titleAdd(HashMap<String, String> params) {
		logger.info("params : "+params);
		dao.titleAdd(params);
		// 회원 테이블 업데이트
		ArrayList<TitleAdmDTO> list = dao.getTitleIdx();
		for (TitleAdmDTO dto : list) {
			logger.info("타이틀 번호 : "+dto.getMt_idx());
			dao.memberUpdate(dto.getMt_idx());
		}
	}


	// 타이틀 수정 페이지
	// by.승진 2022-08-14
	public ModelAndView titleUpdateForm(String idx) {
		ModelAndView mav = new ModelAndView("admin/titleAdmUpdate");
		logger.info("idx = "+idx);
		TitleAdmDTO dto = dao.titleUpdateForm(idx);
		mav.addObject("dto", dto);
		return mav;
	}

	// 타이틀 수정
	// by.승진 2022-08-14
	public void titleUpdate(HashMap<String, String> params) {

		dao.titleUpdate(params);
		// 회원 테이블 업데이트
		ArrayList<TitleAdmDTO> list = dao.getTitleIdx();
		
		for (TitleAdmDTO dto : list) {
			logger.info("타이틀 번호 : "+dto.getMt_idx());
			dao.memberUpdate(dto.getMt_idx());
		}
			
	}


	// 타이틀 중복 검사
	public int chkDuple(HashMap<String, String> params) {
		return dao.chkDuple(params);
	}


	public int chkUpdateDuple(HashMap<String, String> params) {
		return dao.chkUpdateDuple(params);
	}

}
