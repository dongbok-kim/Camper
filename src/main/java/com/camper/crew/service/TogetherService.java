package com.camper.crew.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.crew.dao.TogetherDAO;
import com.camper.crew.dto.TogetherDTO;

@Service
public class TogetherService {

	@Autowired TogetherDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	//크루모집 리스트
	public ArrayList<TogetherDTO> list() {
		return dao.list();
	}

	//모집글 상세보기
	public TogetherDTO view(int ct_idx) {
		return dao.view(ct_idx);
	}


}
