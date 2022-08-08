package com.camper.profile.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.profile.dao.ProfileDAO;

@Service
public class ProfileService {

	@Autowired ProfileDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

}
