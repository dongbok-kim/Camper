package com.camper.admin.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.camper.admin.dao.AgeAdmDAO;
import com.camper.admin.dto.AgeAdmDTO;

@Service
public class AgeAdmService {

	@Autowired AgeAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public int ageReg(int ma_age) {
		return dao.ageReg(ma_age);
		
	}

	public void ageList(Model model) {
		ArrayList<AgeAdmDTO> age = dao.ageList();
		model.addAttribute("list", age);
		
		logger.info("list :"+age);
	}

	public void ageUpdate(Model model, int ma_idx) {
		AgeAdmDTO dto = dao.ageUpdate(ma_idx);
		model.addAttribute("age",dto);
		
	}

	public int ageUpdateForm(Model model, int ma_idx, int ma_age) {
		return dao.ageUpdateForm(ma_idx, ma_age);
		
	}

	
		

}
