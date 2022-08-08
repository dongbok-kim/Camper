package com.camper.camping.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.camping.dao.CampingDAO;

@Service
public class CampingService {

	@Autowired CampingDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

}
