package com.camper.admin.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.admin.dao.TogetherAdmDAO;

@Service
public class TogetherAdmService {

	@Autowired TogetherAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

}
