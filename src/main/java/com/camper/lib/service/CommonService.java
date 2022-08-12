package com.camper.lib.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.lib.dao.CommonDAO;

@Service
public class CommonService {

	@Autowired CommonDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	
	// 캠핑장 찜해제
	// by. 승진 2022-08-11
	public void campingLikeDelete(String idx, String loginId) {
		dao.campingLikeDelete(idx, loginId);
	}

	
	// 블라인드 등록(마이페이지 - 모집글 삭제)
	// by.승진 2022-08-11
	public void blindSelf(String idx, String loginId) {
		dao.blindSelf(idx, loginId);
	}
	
	
	// 블라인드 등록(관리자)
	// by.승진 2022-08-12
	public void blind(HashMap<String, String>  params) {
		dao.blind(params);
	}
	
	// 차단 회원 해제
	// by.승진 2022-08-12
	public void blockDelete(String idx, String loginId) {
		dao.blockDelete(idx, loginId);
	}


}
