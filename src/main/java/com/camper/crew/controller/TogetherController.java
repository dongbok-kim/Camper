package com.camper.crew.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camper.crew.dto.TogetherDTO;
import com.camper.crew.service.TogetherService;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;

@Controller
public class TogetherController {

	@Autowired
	TogetherService service;

	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 크루모집 목록
	@RequestMapping(value = "/crewTogetherList.do")
	public String crewTogetherList(
			Model model,
			HttpSession session,
			Criteria cri,
			@RequestParam(required = false) String ct_gender,
			@RequestParam(required = false) ArrayList<String> ct_camping_type,
			@RequestParam(required = false) ArrayList<String> ct_age,
			@RequestParam(required = false) String ct_pet,
			@RequestParam(required = false) String ct_tool,
			@RequestParam(required = false) String ct_wish_start,
			@RequestParam(required = false) String ct_wish_end,
			@RequestParam(required = false) String cp_name
			) {
		String loginId = (String) session.getAttribute("loginId");

		ArrayList<TogetherDTO> recom;

		if (loginId != null) {
			recom = service.recom(loginId);
		} else {
			recom = service.recom();
		}

		model.addAttribute("recomList", recom); // 크루추천
		
		cri.setAmount(8);
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		if(ct_gender != null && !ct_gender.trim().equals("")) {
			params.put("ct_gender", ct_gender);
			model.addAttribute("ct_gender", ct_gender);
		}
		
		if(ct_camping_type != null && ct_camping_type.size() > 0) {
			params.put("ct_camping_type", ct_camping_type.toString().replaceAll(",", "|"));
			model.addAttribute("ct_camping_type", ct_camping_type);
		}
		
		if(ct_age != null && ct_age.size() > 0) {
			params.put("ct_age", ct_age);
			model.addAttribute("ct_age", ct_age);
		}
		
		if(ct_pet != null && !ct_pet.trim().equals("")) {
			params.put("ct_pet", ct_pet);
			model.addAttribute("ct_pet", ct_pet);
		}
		
		if(ct_tool != null && !ct_tool.trim().equals("")) {
			params.put("ct_tool", ct_tool);
			model.addAttribute("ct_tool", ct_tool);
		}
		
		if(ct_wish_start != null && !ct_wish_start.trim().equals("") && ct_wish_end != null && !ct_wish_end.trim().equals("")) {
			params.put("ct_wish_start", ct_wish_start);
			model.addAttribute("ct_wish_start", ct_wish_start);
			
			params.put("ct_wish_end", ct_wish_end);
			model.addAttribute("ct_wish_end", ct_wish_end);
		}
		
		if(cp_name != null && !cp_name.trim().equals("")) {
			params.put("cp_name", cp_name);
			model.addAttribute("cp_name", cp_name);
		}
		
		int crewCnt = service.crewCnt(params);
		model.addAttribute("crewCnt", crewCnt);
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, crewCnt);
		
		int pageNum = cri.getPageNum();
		
		if (pageMaker.getStartPage() < 0) {
			logger.info("startPage : "+pageMaker.getStartPage());
			pageMaker.setStartPage(1);
		}
		
		if(pageMaker.getEndPage() > 0 && pageNum > pageMaker.getEndPage()) {
			pageNum = pageMaker.getEndPage();
			cri.setPageNum(pageNum);
		}
		
		int skip = (pageNum - 1) * cri.getAmount();
		params.put("skip", skip);
		model.addAttribute("skip", skip);
		
		params.put("amount", cri.getAmount());
		
		String page = "crewTogetherList";
		ArrayList<TogetherDTO> list = service.list(params);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		return page;
	}

	// 크루모집 상세보기
	@RequestMapping(value = "/crewTogetherView.do")
	public String crewTogetherView(@RequestParam String ct_idx, Model model) {
		String page = "crewTogetherView";
		logger.info(ct_idx + "번 크루모집 상세보기");

		TogetherDTO dto = service.view(ct_idx);
		if(dto != null) {
			model.addAttribute("cct", dto);
		} else {
			model.addAttribute("msg", "존재하지 않는 모집글입니다.");
		}

		return page;

	}

	// 모집삭제하기
	@RequestMapping(value = "/crewTogetherDelete.do")
	public String delete(Model model, @RequestParam String ct_idx, HttpSession session) {
		logger.info("삭제요청:" + ct_idx);
		return service.crewTogetherDelete(ct_idx, session);
	}

	/*
	 * //크루추천
	 * 
	 * @RequestMapping(value="/crewTogetherRecommend.go") public String
	 * crewTogetherRecommend (Model model, Criteria cri, HashMap<String,
	 * Object>params) { String page ="crewTogetherRecommend";
	 * if(params.get("keyword")!= null&&
	 * !params.get("keyword").toString().trim().equals("")) {
	 * cri.setKeyword(String)params.get("keyword"); cri.setType(String)
	 * params.get("type"));
	 * 
	 * mav.addObject("keyword", params.get("keyword"));
	 * mav.addObject("type",params.get("type")); }
	 * 
	 * int recommTotal = dao.total(params); mav.addObject("listCnt",total);
	 * 
	 * PageMakerDTO pageMakerDTO = new PageMakerDTO(cri, total);
	 * 
	 * int pageNum = cri.getPageNum();
	 * 
	 * //현재 페이지가 마지막페이지를 초과하지 못하도혹 방지하는 코드 if(pageMaker.getEndPage() > 0 && pageNum
	 * > pageMaker.getEndpage()) { pageNum=pageMaker.getEndPage();
	 * cri.setPageNum(pageNum); } //DAO MAPPER OFFSET int skip = (pageNum -1) *
	 * cri.getAmount(); params.put("skip", skip); mav.addObject("skip",skip);
	 * 
	 * //DAO MAPPER LIMIT params.put("amount",cri.getAmount());
	 * 
	 * ArrayList<TogetherDTO>list=service.list();
	 * 
	 * 
	 * return page;
	 * 
	 * }
	 */

	// =================== 소스트리 충돌 방지 ====================================
	// 지윤 : 크루 모집글 작성, 수정
	// 크루 모집글 이동
	@RequestMapping(value = "/crewTogetherReg.go")
	public String crewReg() {

		return "crewTogetherReg";
	}

	// 크루 모집글 작성 - 캠핑장 검색 팝업
	@RequestMapping(value = "/campPopup.go")
	public ModelAndView campPopup(
			@RequestParam(required = false) ArrayList<String> ca_sido, 
			@RequestParam(required = false) ArrayList<String> ca_theme,
			@RequestParam(required = false) String ca_name,
			@RequestParam(required = false) String ca_pet,
			HttpSession session,
			Criteria cri) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if (ca_sido != null && ca_sido.size() > 0) {
	    	  map.put("ca_sido", ca_sido);			
	      	}
	      if (ca_theme != null && ca_theme.size() > 0) {
	    	  map.put("ca_theme", ca_theme);			
	      	}
	      
	      if (ca_name != null) {
	    	  map.put("ca_name", ca_name);			
	      	}
	      if (ca_pet != null) {			
	    	  map.put("ca_pet", ca_pet);
	      	}
	      
	      logger.info("ca_sido : " + map.get("ca_sido"));
	      logger.info("ca_theme : " + map.get("ca_theme"));
	      logger.info("ca_name : " + map.get("ca_name"));
	      logger.info("ca_pet : " + map.get("ca_pet"));
		
		return service.campPopup(cri, session, map);
	}
	
	// 크루 모집글 작성 하기
	@RequestMapping(value = "/crewReg.do")
	public ModelAndView crewRegForm(HttpSession session, @ModelAttribute TogetherDTO dto,
			@RequestParam(value = "ct_camping_type") String[] campingArr) {
		// String loginId = (String) session.getAttribute("loginId");
		String loginId = "jyr";
		dto.setMb_id(loginId);

		// campingType 배열에서 꺼내서 params에 콤마로 구분해서 담기
		String campingType = "";
		if (campingArr.length == 1) {
			dto.setCt_camping_type(campingArr[0]);
		} else {
			campingType = campingArr[0];
			for (int i = 1; i < campingArr.length; i++) {
				campingType += ',' + campingArr[i];
			}
			dto.setCt_camping_type(campingType);
		}

		logger.info("크루 모집글 작성 제목 : " + dto.getCt_title());
		// return null;
		return service.crewRegFrom(dto);
	}

	// 크루 모집글 수정 데이터 불러오기
	@RequestMapping(value = "/crewTogetherUpdate.go")
	public ModelAndView crewUpdate(@RequestParam int ct_idx,
			HttpSession session) {
		
		logger.info("모집글 수정 컨트롤러");
		return service.crewUpdate(ct_idx,session);
	}

	// 크루 모집글 수정 하기
	@RequestMapping(value = "/crewTogetherUpdate.do")
	public ModelAndView crewUpdateForm(HttpSession session, @ModelAttribute TogetherDTO dto,
			@RequestParam(value = "ct_camping_type") String[] campingArr) {
		String loginId = (String) session.getAttribute("loginId");
		String mb_id = dto.getMb_id();
		
		if (!loginId.equals(mb_id)) { //로그인한 아이디와 작성자가 다른 사람일 경우
			ModelAndView mav = new ModelAndView("redirect:/");
			mav.addObject("msg","본인 글만 수정할 수 있습니다.");
			return mav;
		} else {
			// campingType 배열에서 꺼내서 params에 콤마로 구분해서 담기
			String campingType = "";
			if (campingArr.length == 1) {
				dto.setCt_camping_type(campingArr[0]);
			} else {
				campingType = campingArr[0];
				for (int i = 1; i < campingArr.length; i++) {
					campingType += ',' + campingArr[i];
				}
				dto.setCt_camping_type(campingType);
			}
			
			logger.info("크루 모집글 작성 제목 : " + dto.getCt_title());
			// return null;
			return service.crewUpdateFrom(dto);
		
		}
	}

}
