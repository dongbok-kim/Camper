package com.camper.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dto.TitleAdmDTO;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;
import com.camper.mypage.dao.MyReviewDAO;
import com.camper.mypage.dto.MyReviewDTO;

@Service
public class MyReviewService {

	@Autowired MyReviewDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 캠핑장 후기 작성 페이지
	// by.승진 2022-08-11
	public ModelAndView campingReviewForm(String idx, String loginId) {
		ModelAndView mav = new ModelAndView("mypage/popupCampingReview");
		
		// 유효성 확인
		String chk = dao.chk(idx,loginId);
		
		if (chk.equals("1")) {
			
			MyReviewDTO dto = dao.reviewForm(idx);
			String nickname = dao.nickname(loginId);
			mav.addObject("dto", dto);
			mav.addObject("nickname", nickname);
		
		} else {
			
			mav.setViewName("redirect:/myCrewList.go");
			
		}
		
		
		return mav;
	}

	
	// 캠핑장 후기 작성
	// by.승진 2022-08-11
	public ModelAndView campingReviewWrite(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("mypage/popupClose");
		dao.campingReviewWrite(params);
		return mav;
	}
	
	
	// 캠핑장 후기 목록
	// by.승진 2022-08-11
	public ModelAndView campingReviewList(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("mypage/myCampingReview");
		
		// 검색 연동 페이징
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
		
		
		
		
		
		ArrayList<MyReviewDTO> list = dao.campingReviewList(params);
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}
	
	
	// 캠핑장 후기 삭제
	// by.승진 2022-08-11
	public ModelAndView campingReviewDelete(String idx, String loginId) {
		ModelAndView mav = new ModelAndView("redirect:/myCampingReview.go");
		// 삭제 가능 여부 확인
		MyReviewDTO dto = dao.delAble(idx, loginId);
		Date delAble = dto.getDelAble();
		Date today = dto.getToday();
		
		if (delAble.after(today)) {
			dao.campingReviewDelete(idx, loginId);			
		}
		return mav;
	}
	
	
	// 크루원 후기 작성 페이지
	// by.승진 2022-08-11
	public ModelAndView crewReviewForm(String idx, String loginId) {
		ModelAndView mav = new ModelAndView("mypage/popupCrewReview");
		
		String chk = dao.chk(idx,loginId);
		if (chk.equals("1")) {
			
			// 모임 관련 정보
			MyReviewDTO dto = dao.reviewForm(idx);
			mav.addObject("dto", dto);
			// 크루 목록
			ArrayList<MyReviewDTO> list = dao.crewList(idx, loginId);
			mav.addObject("list", list);
			
		} else {
			
			mav.setViewName("redirect:/myCrewList.go");
			
		}
		
		return mav;
	}


	// 크루 후기 페이지 (받은 후기)
	// by.승진 2022-08-15
	public ModelAndView crewReviewR(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("mypage/myCrewReviewR");
		
		// 검색 연동 페이징
		cri.setAmount(15);
		
		int total = (int) dao.totalR(params);
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
		
		ArrayList<MyReviewDTO> list = dao.crewReviewR(params);
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}


	// 크루 후기 페이지 (작성 후기)
	// by.승진 2022-08-15
	public ModelAndView crewReviewW(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("mypage/myCrewReviewW");
		
		// 검색 연동 페이징
		cri.setAmount(15);
		
		int total = (int) dao.totalW(params);
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
		
		ArrayList<MyReviewDTO> list = dao.crewReviewW(params);
		
		mav.addObject("list", list);
		
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}


	public void crewReview(String assessment, String score, String content, String loginId, String mb_id, String idx) {
		dao.crewReview(assessment, score, content, loginId, mb_id, idx);
	}


	public void crewReviewDelete(String idx, String loginId) {
		dao.crewReviewDelete(idx, loginId);
	}


	public void memberUpdate(String mb_id) {
		dao.memberUpdate(mb_id);
	}


	public String getId(String idx, String loginId) {
		return dao.getId(idx,loginId);
	}


	public void titleUpdate(int i, String mb_id) {
		dao.titleUpdate(i,mb_id);
		
	}


	public ArrayList<TitleAdmDTO> getTitle() {
		return dao.getTitle();
	}





}
