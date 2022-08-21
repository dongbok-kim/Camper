package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.StopAdmDAO;
import com.camper.admin.dto.StopAdmDTO;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;

@Service
public class StopAdmService {

	@Autowired StopAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 관리자 페이지/회원정지 목록
	public ModelAndView stopAdmList(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("admin/stopAdmList");
		
		cri.setAmount(15);
		if (params.get("keyword") != null && !params.get("keyword").toString().trim().equals("")) {
			cri.setKeyword((String) params.get("keyword"));
			cri.setType((String) params.get("type"));
			
			// View에서 내가 선택한 옵션과 검색어를 유지시키기 위해서 다시 ModelAndView로 보낸다
			mav.addObject("keyword", (String) params.get("keyword"));
			mav.addObject("type", (String) params.get("type"));
		}
		mav.addObject("filter", (String) params.get("filter"));
		
		int total = dao.stopCnt(params);
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
		
		logger.info("skip : "+skip);
		// DAO MAPPER LIMIT
		params.put("amount", cri.getAmount());
				
		ArrayList<StopAdmDTO> list = dao.stopList(params);
		
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}

	public ModelAndView stopPopup(String mb_id) {
		logger.info("회원 정지 팝업 서비스 도착");
		// 정지기록 리스트
		ArrayList<StopAdmDTO> list = dao.stopPopup(mb_id);
		ModelAndView mav = new ModelAndView("admin/popupStopAdm");
		logger.info("count / end_date ");
		
		mav.addObject("list", list);
		mav.addObject("mb_id", mb_id);
		return mav;
	}

	@Transactional(isolation = Isolation.DEFAULT)
	public ModelAndView stopAdmReg(HashMap<String, String> params) {
		String mb_id = params.get("mb_id");
		ModelAndView mav = new ModelAndView("redirect:/stopPopup.go?mb_id="+mb_id);
		dao.stopAdmReg(params);
		dao.stopMbStatus(mb_id); // 회원상태를 "정지"로 변경
		return mav;
	}

}
