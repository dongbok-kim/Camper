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

	public String reportUpdate(@RequestParam HashMap<String, String> params, 
			MultipartFile[] rp_img) {
		
		int row = dao.reportUpdate(params);
		int rp_idx = Integer.parseInt(params.get("rp_idx"));
		//이미지 저장 기능 임시작업
		fileSave(rp_img, rp_idx);
		return "admin/reportList";
		
	}

	private void fileSave(MultipartFile[] rp_img, int rp_idx) {
		//파일 업로드
		logger.info("파일업로드");
		for(MultipartFile photo : rp_img) {
			String oriFileName = photo.getOriginalFilename();
			if(!oriFileName.equals("")) {
				logger.info("이미지 업로드 진행");
				// 3-2. 확장자 분리
				String ext = oriFileName.substring(oriFileName.lastIndexOf(".")).toLowerCase();
				// 3-3. 새 이름 만들기
				String newFileName = System.currentTimeMillis()+ext;
				
				logger.info(oriFileName + "=>" + newFileName); 
				
				// 3-4. 파일 받아서 저장하기
				try {
					byte[] arr = photo.getBytes();
					Path path = Paths.get("C:\\STUDY\\SPRING_ADVANCE\\Camper\\src\\main\\webapp\\resources\\reportPhoto\\"+newFileName);
					Files.write(path,arr);
					logger.info(newFileName+" - save ok");
					// 4. 업로드 후 photo 테이블에 데이터 입력
					dao.fileWrite(oriFileName, newFileName, rp_idx);
					
				} catch (IOException e) {
					e.printStackTrace();
				}				
			}
		}
		
	}

	public ModelAndView reportSearch(HashMap<String, String> params) {
		ArrayList<ReportAdmDTO> list = dao.reportSearch(params);
		ModelAndView mav = new ModelAndView("reportList");
		mav.addObject("list",list);
		return mav;
	}

}
