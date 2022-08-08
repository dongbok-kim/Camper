package com.camper.crew.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.crew.dao.TogetherDAO;

@Service
public class TogetherService {

	@Autowired TogetherDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

}
