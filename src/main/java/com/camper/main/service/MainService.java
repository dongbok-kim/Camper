package com.camper.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.main.dao.MainDAO;

@Service
public class MainService {

	@Autowired MainDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

}
