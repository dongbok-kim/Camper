package com.camper.camping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.camping.dto.CampingDTO;
import com.camper.camping.service.CampingService;

@Controller
public class CampingController {

	@Autowired CampingService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//캠핑장 리스트, 추천
	@RequestMapping (value = "/campingList.go")
    public ModelAndView campingList(HttpSession session) {
    	return service.campingList(session);	
    }
	
	//캠핑장 상세보기
	@RequestMapping (value = "/campingView.go")
    public ModelAndView campingView(HttpSession session, @RequestParam String ca_idx) {
		logger.info(ca_idx + "번 요청");
    	return service.campingView(session, ca_idx);	
    }
	
	/*
	@RequestMapping (value = "/campingSearch")
    public ModelAndView cw(@RequestParam MultiValueMap<String, String> params) {
		List<String> ca_sido = params.get("ca_sido");
		logger.info("dzzz : " + ca_sido);
		String ca_name = params.get("ca_name").toString();
		logger.info("ca_name : " + ca_name.length());
		
		
    	return null;	
    }
    */

	/*
	@RequestMapping (value = "/campingSearch")
    public ModelAndView campingSearch(@RequestParam HashMap<String, Object> params, HttpServletRequest request) {
		Map parameterMap = request.getParameterMap();
		String[] ca_sido = (String[]) parameterMap.get("ca_sido");
		String[] ca_theme = (String[]) parameterMap.get("ca_theme");
		
		String ca_pet = (String)params.get("ca_pet");
		String ca_name = (String)params.get("ca_name");
		
		if(ca_sido != null && ca_sido.length > 0) {
			for (String item : ca_sido) {
				logger.info("ca_sido : " + item);
				
			}
			params.put("ca_sido", ca_sido);
		}
		
		if(ca_theme != null && ca_theme.length > 0) {
			for (String item : ca_theme) {
				logger.info("ca_theme : " + item);
				params.put("ca_theme", item);
			}
		}
		
		  params.put("ca_pet", ca_pet); params.put("ca_name", ca_name);
		
		
		logger.info("ca_sido : " + ca_sido);
		logger.info("ca_pet: " + ca_pet);
		logger.info("ca_name: " + ca_name);

    	return service.campingSearch(params);	
	}
	*/

	/*
	@RequestMapping (value = "/campingSearch")
    public ModelAndView cw(@RequestParam HashMap<String, String> params, HttpServletRequest request) {
		
		//String[] ca_sido = request.getParameterValues("ca_sido");
		
		
		
		logger.info("params? : " + params);
		/*
		if(ca_sido.length > 0) {
			for (int i = 0; i < ca_sido.length; i++) {
				logger.info("ca_sido : "+ca_sido[i]);
			}
		}
	
		
		return null;
    }
	*/
    
	
	//검색, -> 리스트로 옮길 예정
	@RequestMapping (value = "/campingSearch")
	public ModelAndView campingSearch(
			@RequestParam(required = false) ArrayList<String> ca_sido, 
			@RequestParam(required = false) ArrayList<String> ca_theme,
			@RequestParam(required = false) String ca_name,
			@RequestParam(required = false) String ca_pet
			) {
		
		
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      
	      if (ca_sido.size() > 0) {
	    	  map.put("ca_sido", ca_sido);			
	      	}
	      if (ca_theme.size() > 0) {
	    	  map.put("ca_theme", ca_theme);			
	      	}
	      
	      if (ca_name != null) {
	    	  map.put("ca_name", ca_name);			
	      	}
	      if (ca_pet != null) {			
	    	  map.put("ca_pet", ca_pet);
	      	}
	      
	      //ArrayList<CampingDTO> campingList = service.campingList(map);	
	      
	      //ArrayList<CampingDTO> campingList = service.campingList();
	      
	      logger.info("ca_sido : " + map.get("ca_sido"));
	      logger.info("ca_theme : " + map.get("ca_theme"));
	      logger.info("ca_name : " + map.get("ca_name"));
	      logger.info("ca_pet : " + map.get("ca_pet"));
	    return null;
   }
   
   
   
	
	
}
