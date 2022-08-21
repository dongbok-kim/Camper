package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dao.CampingAdmDAO;
import com.camper.admin.dto.CampingAdmDTO;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;

@Service
public class CampingAdmService {

	@Autowired CampingAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 관리자 페이지 / 캠핑장 목록
	public ModelAndView campingAdmList(Criteria cri, HashMap<String, Object> params) {
		
		ModelAndView mav = new ModelAndView("admin/campingAdmList");
		logger.info("캠핑장 목록 params : "+params);
		// 검색 연동 페이징
		cri.setAmount(15);
		if(params.get("keyword") != null && !params.get("keyword").toString().trim().equals("")) {
			cri.setKeyword((String) params.get("keyword"));
			//cri.setType((String) params.get("type"));
			
			//View에서 내가 선택한 옵션과 검색어를 유지시키기 위해서 다시 ModelAndView로 보낸다
			mav.addObject("keyword", params.get("keyword"));
			//mav.addObject("type", params.get("type"));
		}
		mav.addObject("filterStatus", params.get("filterStatus"));
		mav.addObject("filterSido", params.get("filterSido"));
		mav.addObject("apiList",params.get("apiList"));
		
		int total = dao.campingTotal(params);
		mav.addObject("listCnt", total);
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
		
		int pageNum = cri.getPageNum();
		
		// 없는 단어를 검색했을 경우를 위함
		if(pageMaker.getStartPage()<0) {
			pageMaker.setStartPage(1);
		}
		
		//현재 페이지가 마지막 페이지를 초과하지 못하도록 방지하는 코드
		if(pageMaker.getEndPage() > 0 && pageNum > pageMaker.getEndPage()) {
			pageNum = pageMaker.getEndPage();
			cri.setPageNum(pageNum);
		}
		
		//DAO MAPPER OFFSET
		int skip = (pageNum - 1) * cri.getAmount();
		params.put("skip", skip);
		mav.addObject("skip", skip);
		
		//DAO MAPPER LIMIT
		params.put("amount", cri.getAmount());
		
		ArrayList<CampingAdmDTO> list = dao.campingAdmList(params);
		mav.addObject("list",list);
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}
	
	// 관리자 페이지 / 캠핑장 상세보기 이동
	public ModelAndView campingAdmView(HashMap<String, Object> params) {
		logger.info("캠핑장 상세보기 : {}",params.get("ca_idx"));
		
		// 캠핑장 원본 데이터 요청
		CampingAdmDTO dto = dao.campingAdmView(params);
		ModelAndView mav = new ModelAndView("admin/campingAdmView");
		mav.addObject("oriCamp", dto);
		logger.info("oriCamp NAME : "+dto.getCa_name());
		
		// 캠핑장 api 업데이트 데이터 요청
		CampingAdmDTO api = dao.campingAdmAPI(params);
		if(api == null) {
			api = dto;
			mav.addObject("msg","본 캠핑장은 api에서 삭제된 캠핑장입니다.");
		}
		mav.addObject("newCamp",api);
		//logger.info("newCamp NAME : "+api.getCa_name());
		logger.info("api : " + api);
		
		/*
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
		 * */

		
		
		
		
		
		//페이징 정보
		String filterStatus = (String) params.get("filterStatus");
		String filterSido = (String) params.get("filterSido");
		String keyword = (String) params.get("keyword");
		String pageNum = (String) params.get("pageNum");
		
		if (filterStatus != null) {
			mav.addObject("filterStatus", filterStatus);
		}
		if(filterSido != null) {
			mav.addObject("filterSido", filterSido);
		}
		if(keyword != null) {
			mav.addObject("keyword", keyword);
		}
		if(pageNum != null) {
			mav.addObject("pageNum", pageNum);
		}
		mav.addObject("pageNum", pageNum);
		
		return mav;
	}

	public ModelAndView campingAdmUpdate(HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("redirect:/campingAdmView.go?ca_idx="+params.get("ca_idx"));
		
		CampingAdmDTO dto = dao.campingAdmView(params);
		CampingAdmDTO api = dao.campingAdmAPI(params);
		// 정보 등록 날짜는 변경된 경우에 api 최신날짜에 맞추기 위함
		params.put("ca_create_date", api.getCa_create_date());
		
		// 변경된 주소로 업데이트 한다면 위도, 경도 또한 함께 업데이트 해줘야함
		if(api.getCa_addr_default().equals(params.get("ca_addr_default")) &&
				api.getCa_sido().equals(params.get("ca_sido")) &&
				api.getCa_sigungu().equals(params.get("ca_sigungu"))
				) {
			params.put("ca_mapX", api.getCa_mapX());
			params.put("ca_mapY", api.getCa_mapY());
			logger.info("주소 업데이트");
		} else if (dto.getCa_addr_default().equals(params.get("ca_addr_default")) &&
				dto.getCa_sido().equals(params.get("ca_sido")) &&
				dto.getCa_sigungu().equals(params.get("ca_sigungu"))
				){ 
			// 주소 업데이트가 일어나지 않을 때 위도, 경도 값이 지워지는 것을 방지
			params.put("ca_mapX", dto.getCa_mapX());
			params.put("ca_mapY", dto.getCa_mapY());
			logger.info("기존 주소 유지됨");
		}
				
		dao.campingAdmUpdate(params);
		mav.addObject("msg", "수정이 완료되었습니다.");
		return mav;
	}

}
