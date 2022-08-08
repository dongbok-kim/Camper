package com.camper.camping.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.camping.dao.CampingLikeDAO;

@Service
public class CampingLikeService {

	@Autowired CampingLikeDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

}
