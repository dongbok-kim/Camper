package com.camper.mypage.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.mypage.dao.MyInfoDAO;

@Service
public class MyBlockService {

	@Autowired MyInfoDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

}
