package com.camper.admin.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

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

	@Autowired
	CampingAdmDAO dao;

	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 관리자 페이지 / 캠핑장 목록
	public ModelAndView campingAdmList(Criteria cri, HashMap<String, Object> params) {

		ModelAndView mav = new ModelAndView("admin/campingAdmList");
		logger.info("캠핑장 목록 params : " + params);
		// 검색 연동 페이징
		cri.setAmount(15);
		if (params.get("keyword") != null && !params.get("keyword").toString().trim().equals("")) {
			cri.setKeyword((String) params.get("keyword"));
			// cri.setType((String) params.get("type"));

			// View에서 내가 선택한 옵션과 검색어를 유지시키기 위해서 다시 ModelAndView로 보낸다
			mav.addObject("keyword", params.get("keyword"));
			// mav.addObject("type", params.get("type"));
		}
		mav.addObject("filterStatus", params.get("filterStatus"));
		mav.addObject("filterSido", params.get("filterSido"));
		mav.addObject("apiList", params.get("apiList"));

		int total = dao.campingTotal(params);
		mav.addObject("listCnt", total);

		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);

		int pageNum = cri.getPageNum();

		// 없는 단어를 검색했을 경우를 위함
		if (pageMaker.getStartPage() < 0) {
			pageMaker.setStartPage(1);
		}

		// 현재 페이지가 마지막 페이지를 초과하지 못하도록 방지하는 코드
		if (pageMaker.getEndPage() > 0 && pageNum > pageMaker.getEndPage()) {
			pageNum = pageMaker.getEndPage();
			cri.setPageNum(pageNum);
		}

		// DAO MAPPER OFFSET
		int skip = (pageNum - 1) * cri.getAmount();
		params.put("skip", skip);
		mav.addObject("skip", skip);

		// DAO MAPPER LIMIT
		params.put("amount", cri.getAmount());

		ArrayList<CampingAdmDTO> list = dao.campingAdmList(params);
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);

		return mav;
	}

	// 관리자 페이지 / 캠핑장 상세보기 이동
	public ModelAndView campingAdmView(HashMap<String, Object> params) {
		logger.info("캠핑장 상세보기 : {}", params.get("ca_idx"));

		String page = "";
		ModelAndView mav = new ModelAndView();

		// 캠핑장 원본 데이터 요청
		CampingAdmDTO dto = dao.campingAdmViewD(params);
		mav.addObject("oriCamp",dto);
				
		// 캠핑장 api 업데이트 데이터 요청
		CampingAdmDTO api = dao.campingAdmAPID(params);
		mav.addObject("newCamp",api);
		
		if (api == null) {
			api = dto;
			mav.addObject("msg", "본 캠핑장은 api에서 삭제된 캠핑장입니다.");
		}
		
		// checkbox 요소들은 array로 받아와서 오름차순으로 정렬하기
		
		// ca_theme 
		String newCa_theme = api.getCa_theme();
		String oriCa_theme = dto.getCa_theme();
		
		String[] newCa_themeArr = newCa_theme.split(",");
		String[] oriCa_themeArr = oriCa_theme.split(",");
		
			// 오름차순 모양으로 정렬한 후 dto에 담기
		Arrays.sort(newCa_themeArr);
		Arrays.sort(oriCa_themeArr);
		
		if (newCa_themeArr.length == 1) {
			api.setCa_theme(newCa_themeArr[0]);
		} else {
			newCa_theme = newCa_themeArr[0];
			for (int i = 1; i < newCa_themeArr.length; i++) {
				newCa_theme += ',' + newCa_themeArr[i];
			}	
			api.setCa_theme(newCa_theme);
		}
		
		if (oriCa_themeArr.length == 1) {
			dto.setCa_theme(oriCa_themeArr[0]);
		} else {
			oriCa_theme = oriCa_themeArr[0];
			for (int i = 1; i < oriCa_themeArr.length; i++) {
				oriCa_theme += ',' + oriCa_themeArr[i];
			}	
			dto.setCa_theme(oriCa_theme);
		}
				
		logger.info("ori : {} / new : {}", dto.getCa_theme(),api.getCa_theme());
		
	
		// ca_sub_facility
		String newCa_sub_facility = api.getCa_sub_facility();
		String oriCa_sub_facility = dto.getCa_sub_facility();
		
		String[] newCa_sub_facilityArr = newCa_sub_facility.split(",");
		String[] oriCa_sub_facilityArr = oriCa_sub_facility.split(",");
		
			// 오름차순 모양으로 정렬한 후 dto에 담기
		Arrays.sort(newCa_sub_facilityArr);
		Arrays.sort(oriCa_sub_facilityArr);
		
		if (newCa_sub_facilityArr.length == 1) {
			api.setCa_sub_facility(newCa_sub_facilityArr[0]);
		} else {
			newCa_sub_facility = newCa_sub_facilityArr[0];
			for (int i = 1; i < newCa_sub_facilityArr.length; i++) {
				newCa_sub_facility += ',' + newCa_sub_facilityArr[i];
			}	
			api.setCa_sub_facility(newCa_sub_facility);
		}
		
		if (oriCa_sub_facilityArr.length == 1) {
			dto.setCa_sub_facility(oriCa_sub_facilityArr[0]);
		} else {
			oriCa_sub_facility = oriCa_sub_facilityArr[0];
			for (int i = 1; i < oriCa_sub_facilityArr.length; i++) {
				oriCa_sub_facility += ',' + oriCa_sub_facilityArr[i];
			}	
			dto.setCa_sub_facility(oriCa_sub_facility);
		}
		
		// ca_possibilty
		String newCa_possibilty = api.getCa_possibilty();
		String oriCa_possibilty = dto.getCa_possibilty();
		
		String[] newCa_possibiltyArr = newCa_possibilty.split(",");
		String[] oriCa_possibiltyArr = oriCa_possibilty.split(",");
		
			// 오름차순 모양으로 정렬한 후 dto에 담기
		Arrays.sort(newCa_possibiltyArr);
		Arrays.sort(oriCa_possibiltyArr);
		
		if (newCa_possibiltyArr.length == 1) {
			api.setCa_possibilty(newCa_possibiltyArr[0]);
		} else {
			newCa_possibilty = newCa_possibiltyArr[0];
			for (int i = 1; i < newCa_possibiltyArr.length; i++) {
				newCa_possibilty += ',' + newCa_possibiltyArr[i];
			}	
			api.setCa_possibilty(newCa_possibilty);
		}
		
		if (oriCa_possibiltyArr.length == 1) {
			dto.setCa_possibilty(oriCa_possibiltyArr[0]);
		} else {
			oriCa_possibilty = oriCa_possibiltyArr[0];
			for (int i = 1; i < oriCa_possibiltyArr.length; i++) {
				oriCa_possibilty += ',' + oriCa_possibiltyArr[i];
			}	
			dto.setCa_possibilty(oriCa_possibilty);
		}
		
		
		// ca_environment
		String newCa_environment = api.getCa_environment();
		String oriCa_environment = dto.getCa_environment();
		
		String[] newCa_environmentArr = newCa_environment.split(",");
		String[] oriCa_environmentArr = oriCa_environment.split(",");
		
			// 오름차순 모양으로 정렬한 후 dto에 담기
		Arrays.sort(newCa_environmentArr);
		Arrays.sort(oriCa_environmentArr);
		
		if (newCa_environmentArr.length == 1) {
			api.setCa_environment(newCa_environmentArr[0]);
		} else {
			newCa_environment = newCa_environmentArr[0];
			for (int i = 1; i < newCa_environmentArr.length; i++) {
				newCa_environment += ',' + newCa_environmentArr[i];
			}	
			api.setCa_environment(newCa_environment);
		}
		
		if (oriCa_environmentArr.length == 1) {
			dto.setCa_environment(oriCa_environmentArr[0]);
		} else {
			oriCa_environment = oriCa_environmentArr[0];
			for (int i = 1; i < oriCa_environmentArr.length; i++) {
				oriCa_environment += ',' + oriCa_environmentArr[i];
			}	
			dto.setCa_environment(oriCa_environment);
		}
		
		// ca_tool
		// ca_fire_cnt
		// ca_oper_period
		
		// 페이징 정보
		String filterStatus = (String) params.get("filterStatus");
		String filterSido = (String) params.get("filterSido");
		String keyword = (String) params.get("keyword");
		String pageNum = (String) params.get("pageNum");

		if (filterStatus != null) {
			mav.addObject("filterStatus", filterStatus);
		}
		if (filterSido != null) {
			mav.addObject("filterSido", filterSido);
		}
		if (keyword != null) {
			mav.addObject("keyword", keyword);
		}
		if (pageNum != null) {
			mav.addObject("pageNum", pageNum);
		}
		mav.addObject("pageNum", pageNum);
		mav.setViewName("admin/campingAdmView");

		return mav;
	}

	public ModelAndView campingAdmUpdate(CampingAdmDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/campingAdmView.go?ca_idx=" + dto.getCa_idx());

		CampingAdmDTO ori = dao.campingAdmView(dto);
		CampingAdmDTO api = dao.campingAdmAPI(dto);
		
		// 정보 등록 날짜는 변경된 경우에 api 최신날짜에 맞추기 위함
		dto.setCa_create_date(api.getCa_create_date());

		// 변경된 주소로 업데이트 한다면 위도, 경도 또한 함께 업데이트 해줘야함
		if (api.getCa_addr_default().equals(dto.getCa_addr_default())
				&& api.getCa_sido().equals(dto.getCa_sido())
				&& api.getCa_sigungu().equals(dto.getCa_sigungu())) {
			
			dto.setCa_mapX(api.getCa_mapX());
			dto.setCa_mapY(api.getCa_mapY());
			logger.info("주소 업데이트");
			
		} else if (ori.getCa_addr_default().equals(dto.getCa_addr_default())
				&& ori.getCa_sido().equals(dto.getCa_sido())
				&& ori.getCa_sigungu().equals(dto.getCa_sigungu())) {
			// 주소 업데이트가 일어나지 않을 때 위도, 경도 값이 지워지는 것을 방지
			dto.setCa_mapX(ori.getCa_mapX());
			dto.setCa_mapY(ori.getCa_mapY());
			logger.info("기존 주소 유지됨");
		}
		
		// array 는 오름차순으로 정렬하여 저장하기
		dao.campingAdmUpdate(dto);
		//logger.info("params : "+params);
		mav.addObject("msg", "수정이 완료되었습니다.");
		return mav;
	}

}
