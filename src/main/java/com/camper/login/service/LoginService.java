package com.camper.login.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.login.dao.LoginDAO;

@Service
public class LoginService {

	@Autowired LoginDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

}
