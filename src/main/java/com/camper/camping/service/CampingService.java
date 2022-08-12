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
import com.camper.camping.dto.CampingDTO;


@Service
public class CampingService {

	@Autowired CampingDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView campingList(HttpSession session) {
		
		//String page = "login?";
		String page = "campingList";
		ModelAndView mav = new ModelAndView();
		
		//캠핑장 리스트, 총 캠핑장 수
		ArrayList<CampingDTO> campingList = dao.campingList();	
		int campingCnt = dao.campingCnt();
		mav.addObject("campingCnt", campingCnt);
		mav.addObject("campingList", campingList);
		
		//캠핑장 추천
		ArrayList<CampingDTO> campingRecom = dao.campingRecom();
		mav.addObject("campingRecom", campingRecom);
		logger.info("캠핑장 추천 : ");
		
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

	public ModelAndView campingView(HttpSession session, String ca_idx) {
		
		//String page = "login?";
		String page = "campingView";
		ModelAndView mav = new ModelAndView();
		CampingDTO campingView = dao.campingView(ca_idx);	
		mav.addObject("campingView", campingView);
		
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

}
