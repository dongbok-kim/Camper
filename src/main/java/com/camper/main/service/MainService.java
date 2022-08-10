package com.camper.main.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.main.dao.MainDAO;
import com.camper.main.dto.MainDTO;

@Service
public class MainService {

	@Autowired MainDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public ArrayList<MainDTO> list() {
		logger.info("랜덤 캠핑장");
		
		return dao.list();
		//return null;
	}

	public ArrayList<MainDTO> crew() {
		logger.info("랜덤모집글");
		return dao.crew();
	}

}
