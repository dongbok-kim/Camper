package com.camper.admin.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
		//신고 데이터
		ReportAdmDTO dto = dao.reportView(rp_idx);
		// 이미지 데이터
		ArrayList<ReportAdmDTO> list = dao.photoList(rp_idx);
		
		model.addAttribute("report", dto);
		model.addAttribute("list",list);
		
	}

	public String reportUpdate(@RequestParam HashMap<String, String> params) {
		
		int row = dao.reportUpdate(params);
		logger.info("신고 처리 서비스 횟수: " +row);
		return "admin/reportList";
		
	}

	public ModelAndView reportSearch(HashMap<String, String> params) {
		ArrayList<ReportAdmDTO> list = dao.reportSearch(params);
		ModelAndView mav = new ModelAndView("admin/reportAdmList");
		mav.addObject("list",list);
		return mav;
	}

}
