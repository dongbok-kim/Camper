package com.camper.admin.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.ReportAdmDAO;
import com.camper.admin.dto.ReportAdmDTO;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;

@Service
public class ReportAdmService {
	
	@Autowired ReportAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 신고관리 목록
	public ModelAndView reportList(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("admin/reportAdmList");
		
		cri.setAmount(15);
		if (params.get("keyword") != null && !params.get("keyword").toString().trim().equals("")) {
			cri.setKeyword((String) params.get("keyword"));
			cri.setType((String) params.get("type"));
			
			// View에서 내가 선택한 옵션과 검색어를 유지시키기 위해서 다시 ModelAndView로 보낸다
			mav.addObject("keyword", (String) params.get("keyword"));
			mav.addObject("type", (String) params.get("type"));
		}
		mav.addObject("filter", (String) params.get("filter"));
		
		int total = dao.reportCnt(params);
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
		
		ArrayList<ReportAdmDTO> list = dao.reportList(params);

		mav.addObject("list",list);
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
		
	}
	
	// 신고관리 상세보기
	public ModelAndView reportView(int rp_idx, Criteria cri, HashMap<String, Object> params) {
		//신고 데이터
		ReportAdmDTO dto = dao.reportView(rp_idx);
		// 이미지 데이터
		ArrayList<ReportAdmDTO> list = dao.photoList(rp_idx);
		
		ModelAndView mav = new ModelAndView("admin/reportAdmView");
		
		//페이징 정보
		String filter = (String) params.get("filter");
		String type = (String) params.get("type");
		String keyword = (String) params.get("keyword");
		String pageNum = (String) params.get("pageNum");
		
		if (filter != null) {
			mav.addObject("filter", filter);
		}
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
		
		mav.addObject("report", dto);
		mav.addObject("list",list);
		
		return mav;
	}

	// 신고 관리자 처리
	public String reportUpdate(@RequestParam HashMap<String, String> params) {
		
		int row = dao.reportUpdate(params);
		logger.info("신고 처리 서비스 횟수: " +row);
		return "admin/reportList";
		
	}


}
