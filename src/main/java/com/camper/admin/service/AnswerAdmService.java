package com.camper.admin.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.admin.dao.AnswerAdmDAO;

@Service
public class AnswerAdmService {

	@Autowired AnswerAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

}
