package com.camper.mypage.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.mypage.dao.MyInfoDAO;
import com.camper.mypage.dto.MyInfoDTO;

@Service
public class MyInfoService {

	@Autowired MyInfoDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public MyInfoDTO myInfo(String mb_id) {
		
		return dao.myInfo(mb_id);
	}


}
