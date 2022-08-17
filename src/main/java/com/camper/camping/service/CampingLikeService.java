package com.camper.camping.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.camping.dao.CampingLikeDAO;

@Service
public class CampingLikeService {

	@Autowired CampingLikeDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView campingLike(String loginId, String ca_idx) {
		
		ModelAndView mav = new ModelAndView();
		String page = "/login/login";
	    //로그인 체크
		if(loginId != null) {
			page = "redirect:/campingView.go?ca_idx="+ca_idx;
			dao.campingLike(loginId, ca_idx);
		}else {
			mav.addObject("msg","로그인이 필요한 서비스입니다.");
		}
		
		mav.setViewName(page);
		
		return mav;
	}

	public String clIdx(String ca_idx, String loginId) {
		
		return dao.clIdx(ca_idx, loginId);
	}

}
