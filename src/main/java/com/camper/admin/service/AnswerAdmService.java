package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.AnswerAdmDAO;
import com.camper.admin.dto.AnswerAdmDTO;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;

@Service
public class AnswerAdmService {

	@Autowired AnswerAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 문의글 목록
	public ModelAndView answerList(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("admin/answerAdmList");
		
		cri.setAmount(15);
		if (params.get("keyword") != null && !params.get("keyword").toString().trim().equals("")) {
			cri.setKeyword((String) params.get("keyword"));
			cri.setType((String) params.get("type"));
			
			// View에서 내가 선택한 옵션과 검색어를 유지시키기 위해서 다시 ModelAndView로 보낸다
			mav.addObject("keyword", (String) params.get("keyword"));
			mav.addObject("type", (String) params.get("type"));
		}
		mav.addObject("filter", (String) params.get("filter"));
		
		int answerCnt = dao.answerCnt(params);
		mav.addObject("listCnt", answerCnt);
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, answerCnt);

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
		
		ArrayList<AnswerAdmDTO> list = dao.answerList(params);
		
		mav.addObject("list",list);
		mav.addObject("pageMaker", pageMaker);

		return mav;
	}
	
	// 문의글 상세보기
	public ModelAndView answerView(int in_idx, Criteria cri, HashMap<String, Object> params) {
		AnswerAdmDTO dto = dao.answerView(in_idx);
		ModelAndView mav = new ModelAndView("admin/answerAdmView");
		
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
		
		mav.addObject("answer", dto);
		return mav;
	}
	
	// 답변글 등록
	public String answerReg(HashMap<String, String> params, HttpSession session) {
		String status = params.get("in_status");
		//String ia_admin = (String) session.getAttribute("loginId"); // 답변 작성 관리자
		String ia_admin = "ryu"; // 임시 답변 관리자 아이디
		String idx = params.get("in_idx");
		
		if(status.equals("처리중")) {
			logger.info("처리중");
			dao.updateStatus(params); //
		} else { // 답변내용 작성했으나 답변상태를 변경하지 않은 경우 포함하기 위함
			logger.info("답변완료");
			params.put("in_status", "답변완료");
			params.put("ia_admin", ia_admin);
			dao.updateStatus(params);
			dao.answerReg(params);
		}
		return "redirect:/answerAdmView?in_idx="+idx;
	}

}
