package com.camper.camping.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dto.ReviewAdmDTO;
import com.camper.camping.dao.CampingDAO;
import com.camper.camping.dao.CampingLikeDAO;
import com.camper.camping.dto.CampingDTO;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;


@Service
public class CampingService {

	@Autowired CampingDAO dao;
	@Autowired CampingLikeDAO likedao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	/* 0818 페이징 추가 전
	public ModelAndView campingList(HttpSession session, HashMap<String, Object> map) {
		
		//String page = "login?";
		String page = "campingList";
		ModelAndView mav = new ModelAndView();
		
		//캠핑장 리스트, 총 캠핑장 수
		ArrayList<CampingDTO> campingList = dao.campingList(map);	
		int campingCnt = dao.campingCnt();
		logger.info("asd: " + campingCnt);
		mav.addObject("campingCnt", campingCnt);
		mav.addObject("campingList", campingList);
		logger.info("ㅇㅇ?:" + campingList);
		
		//로그인 회원 지역별 (좋아요 - 싫어요)로 추천하기
		if(session.getAttribute("loginId") != null) {
			ArrayList<CampingDTO> campingRecomUser = dao.campingRecomUser(session.getAttribute("loginId"));
			mav.addObject("campingRecom", campingRecomUser);
			
		}else {
		//비로그인 회원 전체 (좋아요 - 싫어요) 순으로 추천하기
			ArrayList<CampingDTO> campingRecom = dao.campingRecom();
			mav.addObject("campingRecom", campingRecom);
			logger.info("캠핑장 추천 : ");

		}
		//캠핑장 추천
		
		/* 로그인 체크
		if(session.getAttribute("loginId") != null) {
			page = "campingList";
		}else {
			mav.addObject("msg","로그인이 필요한 서비스입니다.");
		}
	
		mav.setViewName(page);
		
		return mav;
	}
	*/

	
	public ModelAndView campingList(Criteria cri, HttpSession session, HashMap<String, Object> map) {
		
		//String page = "login?";
		String page = "campingList";
		ModelAndView mav = new ModelAndView();
		cri.setAmount(3);
		
		//캠핑장 리스트, 총 캠핑장 수
		//ArrayList<CampingDTO> campingList = dao.campingList(map);	
		int campingCnt = dao.campingCnt(map);
		logger.info("asd: " + campingCnt);
		mav.addObject("campingCnt", campingCnt);
		map.put("campingCnt", campingCnt);
		
		//검색 결과 나올 떄 선택한 값 유지하기 위한 작업
		ArrayList<String> ca_sido = (ArrayList<String>) map.get("ca_sido");
		logger.info("ca_sido : " + ca_sido);
		mav.addObject("ca_sido",ca_sido);
		
		ArrayList<String> ca_theme = (ArrayList<String>) map.get("ca_theme");
		logger.info("ca_theme : " + ca_theme);
		mav.addObject("ca_theme",ca_theme);
		
		String ca_pet = (String) map.get("ca_pet");
		String ca_name = (String) map.get("ca_name");
		
		if (ca_pet != null && !ca_pet.trim().equals("")){
			logger.info("ca_pet : " + ca_pet);
			mav.addObject("ca_pet",ca_pet);
		}
		
		if (ca_name != null && !ca_name.trim().equals("")){
			logger.info("ca_name : " + ca_name);
			mav.addObject("ca_name",ca_name);
		}
		
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, campingCnt);
		
		int pageNum = cri.getPageNum();

		
		if (pageMaker.getStartPage() < 0) {
			logger.info("오ㅑ요? : " + pageMaker.getStartPage());
			pageMaker.setStartPage(1);
		}
		
		//현재 페이지가 마지막 페이지를 초과하지 못하도록 방지하는 코드
		if(pageMaker.getEndPage() > 0 && pageNum > pageMaker.getEndPage()) {
			pageNum = pageMaker.getEndPage();
			cri.setPageNum(pageNum);
		}
		
		
		//DAO MAPPER OFFSET
		int skip = (pageNum - 1) * cri.getAmount();
		map.put("skip", skip);
		mav.addObject("skip", skip);
				
		//DAO MAPPER LIMIT
		map.put("amount", cri.getAmount());
				
		ArrayList<CampingDTO> campingList = dao.campingList(map);
		mav.addObject("campingList", campingList);
		
		mav.addObject("pageMaker", pageMaker);
		
		
		//로그인 회원 지역별 (좋아요 - 싫어요)로 추천하기
		if(session.getAttribute("loginId") != null) {
			ArrayList<CampingDTO> campingRecomUser = dao.campingRecomUser(session.getAttribute("loginId"));
			mav.addObject("campingRecom", campingRecomUser);
			
		}else {
		//비로그인 회원 전체 (좋아요 - 싫어요) 순으로 추천하기
			ArrayList<CampingDTO> campingRecom = dao.campingRecom();
			mav.addObject("campingRecom", campingRecom);
			logger.info("캠핑장 추천 : ");

		}
		
		mav.setViewName(page);
		
		return mav;
	}
	
	

	//상세보기
	public ModelAndView campingView(HttpSession session, String ca_idx) {
		
		//String page = "login?";
		String page = "campingView";
		ModelAndView mav = new ModelAndView();
		CampingDTO campingView = dao.campingView(ca_idx);	
		mav.addObject("campingView", campingView);
		
		//찜 해제를 위한 clIdx 가져오기
		String clIdx = likedao.clIdx(ca_idx, (String) session.getAttribute("loginId"));
		mav.addObject("clIdx", clIdx);
		
		
		logger.info("부대시설? : " + campingView.getCa_sub_facility().toString());
		
		//부대시설 배열로 만들어서 보내기
		String campingSub = campingView.getCa_sub_facility().toString();
		if (campingSub != null) {
			logger.info("오냐 ? : " + campingSub);
			
			ArrayList<String> arrIcoList = new ArrayList<String>();
			String[] arrCampingSub = campingSub.split(",");
			
			for (String str : arrCampingSub) {
				if(str.equals("전기")) arrIcoList.add("icoVolt");
				if(str.equals("무선인터넷")) arrIcoList.add("icoWifi");
				if(str.equals("장작판매")) arrIcoList.add("icoWood");
				if(str.equals("온수")) arrIcoList.add("icoHotWater");
				if(str.equals("트렘폴린")) arrIcoList.add("icoTramp");
				if(str.equals("물놀이장")) arrIcoList.add("icoPool");
				if(str.equals("놀이터")) arrIcoList.add("icoPlayZone");
				if(str.equals("산책로")) arrIcoList.add("icoWalk");
				if(str.equals("운동장")) arrIcoList.add("icoGround");
				if(str.equals("운동시설")) arrIcoList.add("icoSports");
				if(str.equals("마트.편의점")) arrIcoList.add("icoMart");
				
			}
			//logger.info("왔냐 ㅋㅋㅋ:" + arrIcoList);
			
			if (arrIcoList.size() > 0) {
				mav.addObject("icoList", arrIcoList);
				
			}
			//mav.addObject("campingSub", arrCampingSub);
		}
		
				
		ArrayList<CampingDTO> campingView_review = dao.campingView_review(ca_idx);	
		mav.addObject("campingReview", campingView_review);

		ArrayList<CampingDTO> campingView_together = dao.campingView_together(ca_idx);	
		mav.addObject("campingTogether", campingView_together);
		logger.info("campingView_together size:" + campingView_together.size());
		/*
		if(session.getAttribute("loginId") != null) {
			page = "detail";
		}else {
			mav.addObject("msg","로그인이 필요한 서비스입니다.");
		}
		*/
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView campingSearch(HashMap<String, Object> params) {
		
		logger.info("검색 서비스 : {}" + params);
		return null;
	}




	

}
