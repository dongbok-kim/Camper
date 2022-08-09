package com.camper.admin.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.camper.admin.dao.ReportAdmDAO;
import com.camper.admin.dto.ReportAdmDTO;

@Service
public class ReportAdmService {
	
	@Autowired ReportAdmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public void reportList(Model model) {
		ArrayList<ReportAdmDTO> list = dao.reportList();
		model.addAttribute("list",list);
		
	}

	public void reportView(Model model, int rp_idx) {
		ReportAdmDTO dto = dao.reportView(rp_idx);
		model.addAttribute("report", dto);
		
	}

}
