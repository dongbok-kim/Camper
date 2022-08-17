package com.camper.camping.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.camping.dao.CampingDAO;
import com.camper.camping.dao.CampingLikeDAO;
import com.camper.camping.dto.CampingDTO;


@Service
public class CampingService {

	@Autowired CampingDAO dao;
	@Autowired CampingLikeDAO likedao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	/* 0815 검색 추가 전 원래
	public ModelAndView campingList(HttpSession session) {
		
		//String page = "login?";
		String page = "campingList";
		ModelAndView mav = new ModelAndView();
		
		//캠핑장 리스트, 총 캠핑장 수
		ArrayList<CampingDTO> campingList = dao.campingList();	
		int campingCnt = dao.campingCnt();
		mav.addObject("campingCnt", campingCnt);
		mav.addObject("campingList", campingList);
		
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
		*/
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




	public ModelAndView campingNew(HttpSession session, String ca_idx) {
		
		ModelAndView mav = new ModelAndView();
		String page = "apitest";
		//api 상세보기 요청
		CampingDTO campingNewApi = dao.campingNewApi(ca_idx);
		mav.addObject("campingNewApi" + campingNewApi);
		logger.info("API NAME : " + campingNewApi.getCa_name().toString());
		
		//원본 상세보기 요청
		CampingDTO campingNew = dao.campingNew(ca_idx);
		mav.addObject("campingNew", campingNew);
		logger.info("API NAME : " + campingNew.getCa_name().toString());
		//캠핑장 이름
		String apiCa_name = campingNewApi.getCa_name().toString();
		String oriCa_name = campingNew.getCa_name().toString();
		
		//우편번호
		String apiCa_postcode = campingNewApi.getCa_postcode().toString();
		String oriCa_postcode = campingNew.getCa_postcode().toString();
		
		//기본주소
		String apiCa_addr_default = campingNewApi.getCa_addr_default().toString();
		String oriCa_addr_default = campingNew.getCa_addr_default().toString();
		
		//상세주소
		String apiCa_addr_detail = campingNewApi.getCa_addr_detail().toString();
		String oriCa_addr_detail = campingNew.getCa_addr_detail().toString();
		
		//운영일
		String apiCa_oper_date = campingNewApi.getCa_oper_date().toString();
		String oriCa_oper_date = campingNew.getCa_oper_date().toString();
		
		//업종 
		String apiCa_induty = campingNewApi.getCa_induty().toString();
		String oriCa_induty = campingNew.getCa_induty().toString();
		
		//운영시기
		String apiCa_oper_period = campingNewApi.getCa_oper_period().toString();
		String oriCa_oper_period = campingNew.getCa_oper_period().toString();
		
		//운영상태
		String apiCa_manage_status = campingNewApi.getCa_manage_status().toString();
		String oriCa_manage_status = campingNew.getCa_manage_status().toString();
		
		//애견동반
		String apiCa_pet = campingNewApi.getCa_pet().toString();
		String oriCa_pet = campingNew.getCa_pet().toString();
		
		//캠핑장비대여
		String apiCa_tool = campingNewApi.getCa_tool().toString();
		String oriCa_tool = campingNew.getCa_tool().toString();
		
		//화로대
		String apiCa_fire_cnt = campingNewApi.getCa_fire_cnt().toString();
		String oriCa_fire_cnt = campingNew.getCa_fire_cnt().toString();
		
		//캠핑장 환경 ca_environment
		String apiCa_environment = campingNewApi.getCa_environment().toString();
		String oriCa_environment = campingNew.getCa_environment().toString();
		
		//부대시설 ca_sub_facility
		String apiCa_sub_facility = campingNewApi.getCa_sub_facility().toString();
		String oriCa_sub_facility = campingNew.getCa_sub_facility().toString();
		
		//한줄소개 ca_intro
		String apiCa_intro = campingNewApi.getCa_intro().toString();
		String oriCa_intro = campingNew.getCa_intro().toString();
		
		//주변이용가능시설 ca_possibilty
		String apiCa_possibilty = campingNewApi.getCa_possibilty().toString();
		String oriCa_possibilty = campingNew.getCa_possibilty().toString();
		
		//테마환경 ca_theme
		String apiCa_theme = campingNewApi.getCa_theme().toString();
		String oriCa_theme = campingNew.getCa_theme().toString();
		
		//이름비교
		if (apiCa_name != oriCa_name) {
			logger.info("수정된 이름 :" + apiCa_name);
			mav.addObject("apiCa_name", apiCa_name);
		}
		//우편번호
		if (apiCa_postcode != oriCa_postcode) {
			logger.info("수정된 우편번호 :" + apiCa_postcode);
			mav.addObject("apiCa_postcode", apiCa_postcode);
		}
		//기본주소
		if (apiCa_addr_default != oriCa_addr_default) {
			logger.info("수정된 기본주소" + apiCa_addr_default);
			mav.addObject("apiCa_addr_default", apiCa_addr_default);
		}
		//상세주소
		if (apiCa_addr_detail != oriCa_addr_detail) {
			logger.info("수정된 상세주소 :" + apiCa_addr_detail);
			mav.addObject("apiCa_addr_detail", apiCa_addr_detail);
		}
		//운영일
		if (apiCa_oper_date != oriCa_oper_date) {
			logger.info("수정된 운영일 :" + apiCa_oper_date);
			mav.addObject("apiCa_oper_date", apiCa_oper_date);
		}
		//업종
		if (apiCa_induty != oriCa_induty) {
			logger.info("수정된 업종 :" + apiCa_induty);
			mav.addObject("apiCa_induty", apiCa_induty);
		}
		//운영시기
		if (apiCa_oper_period != oriCa_oper_period) {
			logger.info("수정된 운영시기 :" + apiCa_oper_period);
			mav.addObject("apiCa_oper_period", apiCa_oper_period);
		}
		//운영상태
		if (apiCa_manage_status != oriCa_manage_status) {
			logger.info("수정된 운영상태 :" + apiCa_manage_status);
			mav.addObject("apiCa_manage_status", apiCa_manage_status);
		}
		//애견동반
		if (apiCa_pet != oriCa_pet) {
			logger.info("수정된 운영상태 :" + apiCa_pet);
			mav.addObject("apiCa_pet", apiCa_pet);
		}
		//캠핑장비대여
		if (apiCa_tool != oriCa_tool) {
			logger.info("수정된 캠핑장비대여 :" + apiCa_tool);
			mav.addObject("apiCa_tool", apiCa_tool);
		}
		//화로대
		if (apiCa_fire_cnt != oriCa_fire_cnt) {
			logger.info("수정된 화로대 :" + apiCa_fire_cnt);
			mav.addObject("apiCa_fire_cnt", apiCa_fire_cnt);
		}
		//캠핑장 환경
		if (apiCa_environment != oriCa_environment) {
			logger.info("수정된 캠핑장 환경 :" + apiCa_environment);
			mav.addObject("apiCa_environment", apiCa_environment);
		}
		//부대시설
		if (apiCa_sub_facility != oriCa_sub_facility) {
			logger.info("수정된 부대시설 :" + apiCa_sub_facility);
			mav.addObject("apiCa_sub_facility", apiCa_sub_facility);
		}
		//한줄소개
		if (apiCa_intro != oriCa_intro) {
			logger.info("수정된 한줄소개 :" + apiCa_intro);
			mav.addObject("apiCa_intro", apiCa_intro);
		}
		//주변이용가능시설
		if (apiCa_possibilty != oriCa_possibilty) {
			logger.info("수정된 주변이용가능시설 :" + apiCa_possibilty);
			mav.addObject("apiCa_possibilty", apiCa_possibilty);
		}
		//테마환경
		if (apiCa_theme != oriCa_theme) {
			logger.info("수정된 테마환경 :" + apiCa_theme);
			mav.addObject("apiCa_theme", apiCa_theme);
		}
		
		
		//노가다 시작 !
		
		mav.setViewName(page);
		
		return mav;
	}

}
