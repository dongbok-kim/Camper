package com.camper.lib.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.lib.dao.CommonDAO;

@Service
public class CommonService {

	@Autowired CommonDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

}
