package com.camper.profile.service;



import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camper.profile.dao.ProfileDAO;
import com.camper.profile.dto.ProfileDTO;

@Service
public class ProfileService {

	@Autowired ProfileDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());



	//프로필 조회
	public ModelAndView profileView(String loginId, String mb_id) {
		String page = "profile";
		ModelAndView mav = new ModelAndView();
		ProfileDTO profileView = dao.profileView(mb_id);
		ArrayList<ProfileDTO>profileTogether = dao.profileTogether(mb_id);
		ArrayList<ProfileDTO>profileReview = dao.profileReview(mb_id);
		String blockCheck = dao.blockCheck(mb_id, loginId);
		
		mav.addObject("profileView", profileView); //프로필보기
		mav.addObject("blockCheck", blockCheck); //차단회원여부 확인
		mav.addObject("profileTogether", profileTogether); //프로필의 작성모집글
		mav.addObject("profileReview", profileReview); //프로필의 받은리뷰
		
		mav.setViewName(page);
		return mav;
	}
	
	
	//신고창 조회
	public ModelAndView report(String loginId, String mb_id) {
		String page = "report";
		ModelAndView mav = new ModelAndView();
		ProfileDTO repoInfo = dao.repoInfo(mb_id);
		ProfileDTO myInfo = dao.myInfo(loginId);
		
		
		mav.addObject("myInfo", myInfo);
		mav.addObject("repoInfo", repoInfo);
				
		
		mav.setViewName(page);
		return mav;
	}

	//차단하기
	public ModelAndView MemberBlock(String mb_id, String loginId) {
		//String page = "profile";
		//ModelAndView mav = new ModelAndView();
		dao.MemberBlock(mb_id, loginId);
		ModelAndView mav = new  ModelAndView("redirect:/profile?mb_id="+mb_id);		
		
		return mav;
	}

	//차단해제
	public ModelAndView MemberBlockDelete(String mb_id, String loginId) {
		dao.MemberBlockDelete(mb_id, loginId);
		ModelAndView mav = new  ModelAndView("redirect:/profile?mb_id="+mb_id);
		return mav;
	}

   

	//신고하기
	public String reportDo(MultipartFile[] photos, HashMap<String, String> params) {
		
		int success = dao.report(params);
		
		logger.info("글 db에 성공하면 1:"+ success);
	      
	    String id = params.get("rp_idx"); //글번호 받아오기
	    logger.info("방금 넣은 글번호" + id);
	      
	    int rp_idx = Integer.parseInt(id); //string을 int로 변환
	    logger.info("int로 바꿔줌" + rp_idx);
	      
	    if(success>0) { //글작성 성공하면 사진업로드 진행
	         photoSave(photos, rp_idx);         
	      }
	      
	         
	      logger.info("글쓰기 성공 여부 : " + success);
	      
	      return null;
	}
	
	 public void photoSave(MultipartFile[] photos, int rp_idx) {
	      // 파일 업로드
	      for(MultipartFile photo:photos) {
	         String ri_ori_name = photo.getOriginalFilename(); //3-1파일명 추출
	         logger.info("photo name: " + photo.getOriginalFilename());
	         
	         if(!photo.getOriginalFilename().equals("")) {
	            logger.info("업로드 진행");
	            
	            //3-2 확장자 분리
	            String ext = ri_ori_name.substring(ri_ori_name.lastIndexOf(".")).toLowerCase();
	            
	            //3-3 새 이름 만들기
	            String ri_new_name = System.currentTimeMillis() + ext;
	            
	            
	            logger.info(ri_ori_name + ri_new_name );            
	            
	            
	            
	            try {
	               byte[] arr =photo.getBytes();
	               Path path = Paths.get("C:\\STUDY\\JAVA_ADVANCE\\Camper\\src\\main\\webapp\\resources\\reportPhoto/" + ri_new_name);
	               Files.write(path, arr);
	               logger.info(ri_new_name + "save ok");
	               //4. 업로드 후 테이블에 데이터 입력
	               
	               dao.photoSave(ri_ori_name, ri_new_name, rp_idx);
	               
	            } catch (IOException e) {
	      
	               e.printStackTrace();
	            }
	            
	            
	      
	         }
	      }      
	                  

	   }

	


}
