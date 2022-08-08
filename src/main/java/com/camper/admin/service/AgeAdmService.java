package com.camper.admin.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.admin.dao.AgeAdmDAO;

@Service
public class AgeAdmService {

	@Autowired AgeAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public int ageReg(int age) {
		return dao.ageReg(age);
		
	}

}
