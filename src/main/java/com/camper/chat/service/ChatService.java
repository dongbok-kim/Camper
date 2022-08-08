package com.camper.chat.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.chat.dao.ChatDAO;

@Service
public class ChatService {

	@Autowired ChatDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

}
