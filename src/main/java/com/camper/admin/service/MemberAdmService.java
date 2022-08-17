package com.camper.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.admin.dao.MemberAdmDAO;
import com.camper.admin.dto.MemberAdmDTO;
import com.camper.lib.utils.Criteria;

@Service
public class MemberAdmService {

	@Autowired MemberAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public ArrayList<MemberAdmDTO> memberAdmList(HashMap<String, Object> params) {
		
		return dao.memberAdmList(params);
	}

	public MemberAdmDTO memberAdmDetail(String mb_id) {
		
		return dao.memberAdmDetail(mb_id);
	}

	public int memberTotal(HashMap<String, Object> params) {
		
		return dao.memberTotal(params);
	}

	

}
