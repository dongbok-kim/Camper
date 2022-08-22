package com.camper.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.admin.dto.CampingAdmDTO;
import com.camper.admin.service.CampingAdmService;
import com.camper.lib.utils.Criteria;

@Controller
public class CampingAdmController {

	@Autowired CampingAdmService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//캠핑장 목록
	// 관리자 페이지 / 캠핑장 목록
	@RequestMapping(value = "/campingAdmList.go")
	public ModelAndView campingAdmList(Criteria cri,
			@RequestParam HashMap<String, Object> params) {
			
		return service.campingAdmList(cri, params);
	}
	
	/*
	 * // 관리자 페이지 / 캠핑장 api 업데이트 수정 목록 보여주기
	 * 
	 * @RequestMapping(value = "/campingAPI.do") public ModelAndView
	 * campingAPI(Criteria cri,
	 * 
	 * @RequestParam HashMap<String, Object> params) {
	 * 
	 * 
	 * return service.campingAdmList(cri, params); }
	 */
	
	// 관리자 페이지 / 캠핑장 상세보기
	@RequestMapping(value = "/campingAdmView.go")
	public ModelAndView campingAdmView(
			@RequestParam HashMap<String, Object> params) {
		logger.info("캠핑장 상세보기 idx : "+params);	
		return service.campingAdmView(params);
	}
	
	//관리자 페이지 / 캠핑장 수정하기
	@RequestMapping(value = "/campingAdmUpdate.do")
	public ModelAndView campingAdmUpdate(
			//@RequestParam HashMap<String, Object> params
			@ModelAttribute CampingAdmDTO dto,
			@RequestParam(required = false, value = "ca_induty") String[] ca_indutyArr,
			@RequestParam(required = false, value = "ca_oper_period") String[] ca_oper_periodArr,
			@RequestParam(required = false, value = "ca_tool") String[] ca_toolArr,
			@RequestParam(required = false, value = "ca_fire_cnt") String[] ca_fire_cntArr,
			@RequestParam(required = false, value = "ca_environment") String[] ca_environmentArr,
			@RequestParam(required = false, value = "ca_sub_facility") String[] ca_sub_facilityArr,
			@RequestParam(required = false, value = "ca_possibilty") String[] ca_possibiltyArr,
			@RequestParam(required = false, value = "ca_theme") String[] ca_themeArr
			) {
		logger.info("관리자 캠핑장 정보 수정 idx : "+dto.getCa_idx());	
		
		//배열에서 꺼내서 params에 콤마로 구분해서 담기
				// ca_induty
				String ca_induty = "";
				if (ca_indutyArr == null) {
					dto.setCa_induty(ca_induty);
					logger.info("null임");
				} else if (ca_indutyArr.length == 1) {
					dto.setCa_induty(ca_indutyArr[0]);
				} else {
					ca_induty = ca_indutyArr[0];
					for (int i = 1; i < ca_indutyArr.length; i++) {
						ca_induty += ',' + ca_indutyArr[i];
					}
					dto.setCa_induty(ca_induty);
				}
				//ca_tool
				String ca_tool = "";
				if (ca_toolArr == null) {
					dto.setCa_tool(ca_tool);
					logger.info("null임");
				} else if (ca_toolArr.length == 1) {
					dto.setCa_tool(ca_toolArr[0]);
				} else {
					ca_tool = ca_toolArr[0];
					for (int i = 1; i < ca_toolArr.length; i++) {
						ca_tool += ',' + ca_toolArr[i];
					}
					dto.setCa_tool(ca_tool);
				}
				
				//ca_oper_period
				String ca_oper_period = "";
				if (ca_oper_periodArr == null) {
					dto.setCa_oper_period(ca_oper_period);
					logger.info("null임");
				} else if (ca_oper_periodArr.length == 1) {
					dto.setCa_oper_period(ca_oper_periodArr[0]);
				} else {
					ca_oper_period = ca_oper_periodArr[0];
					for (int i = 1; i < ca_oper_periodArr.length; i++) {
						ca_oper_period += ',' + ca_oper_periodArr[i];
					}
					dto.setCa_oper_period(ca_oper_period);
				}
				//ca_fire_cnt
				String ca_fire_cnt = "";
				if (ca_fire_cntArr == null) {
					dto.setCa_fire_cnt(ca_fire_cnt);
					logger.info("null임");
				} else if (ca_fire_cntArr.length == 1) {
					dto.setCa_fire_cnt(ca_fire_cntArr[0]);
				} else {
					ca_fire_cnt = ca_fire_cntArr[0];
					for (int i = 1; i < ca_fire_cntArr.length; i++) {
						ca_fire_cnt += ',' + ca_fire_cntArr[i];
					}
					dto.setCa_fire_cnt(ca_fire_cnt);
				}
				//ca_environment
				String ca_environment = "";
				if (ca_environmentArr == null) {
					dto.setCa_environment(ca_environment);
					logger.info("null임");
				} else if (ca_environmentArr.length == 1) {
					dto.setCa_environment(ca_environmentArr[0]);
				} else {
					ca_environment = ca_environmentArr[0];
					for (int i = 1; i < ca_environmentArr.length; i++) {
						ca_environment += ',' + ca_environmentArr[i];
					}
					dto.setCa_environment(ca_environment);
				}
				//ca_sub_facility
				String ca_sub_facility = "";
				if (ca_sub_facilityArr == null) {
					dto.setCa_sub_facility(ca_sub_facility);
					logger.info("null임");
				} else if (ca_sub_facilityArr.length == 1) {
					dto.setCa_sub_facility(ca_sub_facilityArr[0]);
				} else {
					ca_sub_facility = ca_sub_facilityArr[0];
					for (int i = 1; i < ca_sub_facilityArr.length; i++) {
						ca_sub_facility += ',' + ca_sub_facilityArr[i];
					}
					dto.setCa_sub_facility(ca_sub_facility);
				}
				//ca_possibilty
				String ca_possibilty = "";
				if (ca_possibiltyArr == null) {
					dto.setCa_possibilty(ca_possibilty);
					logger.info("null임");
				} else if (ca_possibiltyArr.length == 1) {
					dto.setCa_possibilty(ca_possibiltyArr[0]);
				} else {
					ca_possibilty = ca_possibiltyArr[0];
					for (int i = 1; i < ca_possibiltyArr.length; i++) {
						ca_possibilty += ',' + ca_possibiltyArr[i];
					}
					dto.setCa_possibilty(ca_possibilty);
				}
				//ca_theme
				String ca_theme = "";
				if (ca_themeArr == null) {
					dto.setCa_theme(ca_theme);
					logger.info("null임");
				} else if (ca_themeArr.length == 1) {
					dto.setCa_theme(ca_themeArr[0]);
				} else {
					ca_theme = ca_themeArr[0];
					for (int i = 1; i < ca_themeArr.length; i++) {
						ca_theme += ',' + ca_themeArr[i];
					}
					dto.setCa_theme(ca_theme);
				}
		
		return service.campingAdmUpdate(dto);
	}
	
}
