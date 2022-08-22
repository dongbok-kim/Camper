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

import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;
import com.camper.profile.dao.ProfileDAO;
import com.camper.profile.dto.ProfileDTO;


@Service
public class ProfileService {

	@Autowired ProfileDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());



	//프로필 조회(구버전)
	public ModelAndView profileView(String loginId, String mb_id) {
		
		String NormalMember = dao.NormalMember(mb_id); //탈퇴회원 여부 확인
		ModelAndView mav = new ModelAndView();
		String page = "";
		
		if(NormalMember != "탈퇴") {
		
			logger.info("프로필 확인 가능");
			page = "profileNP";
			
						
			ProfileDTO profileView = dao.profileView(mb_id);
			ArrayList<ProfileDTO>profileTogether = dao.profileTogether(mb_id);
			ArrayList<ProfileDTO>profileReview = dao.profileReview(mb_id);
			String blockCheck = dao.blockCheck(mb_id, loginId);
			
			mav.addObject("profileView", profileView); //프로필보기
			mav.addObject("blockCheck", blockCheck); //차단회원여부 확인
			mav.addObject("profileTogether", profileTogether); //프로필의 작성모집글
			mav.addObject("profileReview", profileReview); //프로필의 받은리뷰
		
		} else {			
			logger.info("탈퇴확인은 프로필 확인 불가");
			page = "/mypage/popupClose";
		}
		
		mav.setViewName(page);
		return mav;
	}
	
	
	//신고창 조회
	public ModelAndView report(String loginId, String mb_id) {
		ModelAndView mav = new ModelAndView();
		
		if(loginId == null ) {
			String page = "/mypage/popupClose";
			logger.info("비회원은 신고불가능");
			mav.setViewName(page);
		} else if(loginId.equals(mb_id)){
			String page = "/mypage/popupClose";
			logger.info("자기자신은 신고불가능");
			mav.setViewName(page);
			
			
		} else {
		String page = "report";
		
		ProfileDTO repoInfo = dao.repoInfo(mb_id);
		ProfileDTO myInfo = dao.myInfo(loginId);
		
		
		mav.addObject("myInfo", myInfo);
		mav.addObject("repoInfo", repoInfo);
		mav.setViewName(page);
		
		}		
		
		
		return mav;
	}

	//차단하기
	public ModelAndView MemberBlock(String mb_id, String loginId) {		
		if(loginId == null) {
			logger.info("비회원은 차단 불가능");
		} else {
		//String page = "profile";		
		dao.MemberBlock(mb_id, loginId);				
	}
		ModelAndView mav = new ModelAndView("redirect:/profile?mb_id="+mb_id);
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


	//페이징을 위한 프로필
	public <profileView2> ModelAndView profileView2(Criteria cri, HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView();
		
		String page = "";
		String mb_id = (String)params.get("mb_id");
		String loginId = (String)params.get("loginId");
		
		String NormalMember = dao.NormalMember(mb_id); //탈퇴회원 여부 확인
		
		if(!NormalMember.equals("탈퇴")) {
			logger.info("프로필 확인 가능");
			page = "profile";
		
			ProfileDTO profileView = dao.profileView(mb_id);
			mav.addObject("profileView", profileView); //프로필 확인
			
			
			String blockCheck = dao.blockCheck(mb_id, loginId);
			mav.addObject("blockCheck", blockCheck); //차단회원여부 확인
																	
			//페이징처리 시작
//			cri.setAmount(5);
//			
//			
//				
//			int total = dao.total(params);
//			int total2 = dao.total2(params);
//			mav.addObject("listCnt", total); //총 글수
//			mav.addObject("listCnt2", total2); //총 글수2
//			
//			logger.info("토탈:"+total);
//			logger.info("토탈2:"+total2);
//			
//			PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
//			PageMakerDTO pageMaker2 = new PageMakerDTO(cri, total2);
//			
//			int pageNum = cri.getPageNum();
//			int pageNum2 = cri.getPageNum();
//		
//			
//			logger.info("페이지넘버:" + pageNum);
//			logger.info("페이지넘버2:" + pageNum2);
//			
//			if (pageMaker.getStartPage() <0 ) {
//				pageMaker.setStartPage(1);
//			}
//			
//			
//			if (pageMaker2.getStartPage() <0 ) {
//				pageMaker2.setStartPage(1);
//			}
//			
//			
//			
//			
//			//현재페이지가 마지막 페이지를 초과하지 못하도록
//			if(pageMaker.getEndPage() > 0 && pageNum > pageMaker.getEndPage()) {
//				pageNum = pageMaker.getEndPage();
//				cri.setPageNum(pageNum);
//				
//				
//			}
//			
//			if(pageMaker2.getEndPage() > 0 && pageNum2 > pageMaker2.getEndPage()) {
//				pageNum2 = pageMaker2.getEndPage();
//				cri.setPageNum(pageNum2);
//								
//			}
//			
//			logger.info("끝페이지:" + pageMaker.getEndPage() );
//			logger.info("끝페이지2:" + pageMaker2.getEndPage() );
//			
//			
//			
//			// dao mapper offset
//			int skip = (pageNum-1)*cri.getAmount();
//			params.put("skip", skip);
//			mav.addObject("skip", skip);
//			
//			
//			
//			int skip2 = (pageNum2-1)*cri.getAmount();
//			params.put("skip2", skip2);
//			mav.addObject("skip2", skip2);
//					
//			
//			
//			//dao mapper limit
//			params.put("amount", cri.getAmount());
//			
//			
//			
//			ArrayList<ProfileDTO>list = dao.profileView2(params);
//			ArrayList<ProfileDTO>list2 = dao.profileReview2(params);
//			
//			mav.addObject("list", list);
//			mav.addObject("list2", list2);
//			mav.addObject("pageMaker", pageMaker);			
//			mav.addObject("pageMaker2", pageMaker2);
			
		} else {
			
			logger.info("탈퇴회원임");
			page = "/mypage/popupClose";
		}
		
		mav.setViewName(page);
		return mav;
	}


	public HashMap<String, Object> getMemberReview(Criteria cri, HashMap<String, Object> params) {

		String NormalMember = dao.NormalMember((String) params.get("mb_id")); //탈퇴회원 여부 확인
		
		if(!NormalMember.equals("탈퇴")) {
		
			int total = dao.total2(params);
			PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
			int pageNum = cri.getPageNum();
			
			if (pageMaker.getStartPage() <0 ) {
				pageMaker.setStartPage(1);
			}
			
			if(pageMaker.getEndPage() > 0 && pageNum > pageMaker.getEndPage()) {
				pageNum = pageMaker.getEndPage();
				cri.setPageNum(pageNum);
			}
			
			int skip = (pageNum - 1) * cri.getAmount();
			params.put("skip", skip);
			
			params.put("amount", cri.getAmount());
			
			ArrayList<ProfileDTO> list = dao.profileReview2(params);

			String item = dataList(list, (String) params.get("tabIdx"));
			params.put("list", item);
			
			String pageMakerPageing = pageMakerPageing(pageMaker);
			params.put("pageMaker", pageMakerPageing);
			
		}
		
		return params;
	}


	public HashMap<String, Object> getCrewTogether(Criteria cri, HashMap<String, Object> params) {

		String NormalMember = dao.NormalMember((String) params.get("mb_id")); //탈퇴회원 여부 확인
		
		if(!NormalMember.equals("탈퇴")) {
			
			int total = dao.total(params);
			PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
			int pageNum = cri.getPageNum();
			
			if (pageMaker.getStartPage() < 0) {
				pageMaker.setStartPage(1);
			}
			
			if(pageMaker.getEndPage() > 0 && pageNum > pageMaker.getEndPage()) {
				pageNum = pageMaker.getEndPage();
				cri.setPageNum(pageNum);
			}
			
			int skip = (pageNum - 1) * cri.getAmount();
			params.put("skip", skip);
			
			params.put("amount", cri.getAmount());
			
			ArrayList<ProfileDTO> list = dao.profileView2(params);
			
			String item = dataList(list, (String) params.get("tabIdx"));
			params.put("list", item);
			
			String pageMakerPageing = pageMakerPageing(pageMaker);
			params.put("pageMaker", pageMakerPageing);
			
		}
		
		return params;
	}
	
	
	private String dataList(ArrayList<ProfileDTO> arrList, String tabIdx) {
		
		String list = "";
		
		for (ProfileDTO item : arrList) {
			if(tabIdx.equals("1")) {
				list += "<tr>\r\n" + 
						"	<td>" + item.getMr_assessment() + "</td>\r\n" + 
						"	<td>" + item.getMr_content() + "</td>\r\n" + 
						"</tr>";
			} else {
				list += "<tr>\r\n" + 
						"	<td><a href=\"javascript:;\">" + item.getCt_title() + "</a></td>\r\n" + 
						"	<td>" + item.getName() + "&nbsp;" + item.getCt_wish_start() + "&nbsp;~&nbsp;" + item.getCt_wish_end() + "</td>\r\n" + 
						"</tr>";
			}
		}
		
		return list;
	}
	
	
	private String pageMakerPageing(PageMakerDTO pageMaker) {
		
		String pageMakers = "";
		int pageNum = pageMaker.getCri().getPageNum();
		
		if (pageMaker.isPrev() == true) {
			pageNum = pageMaker.getStartPage()-1;
			pageMakers += "<li class=\"pageInfo_btn prev\"><a href=\"javascript:;\" data=\"" + pageNum + "\">이전</a></li>";
		}
		
		for (int i = pageMaker.getStartPage(); i <= pageMaker.getEndPage(); i++) {
			pageNum = i;
			pageMakers += "<li class=\"pageInfo_btn " + (pageMaker.getCri().getPageNum() == i ? "active" : "") + "\"><a href=\"javascript:;\" data=\"" + pageNum + "\">" + pageNum + "</a></li>";
		}
		
		if (pageMaker.isNext() == true) {
			pageNum = pageMaker.getEndPage()+1;
			pageMakers += "<li class=\"pageInfo_btn next\"><a href=\"javascript:;\" data=\"" + pageNum + "\">다음</a></li>";
		}
		
		return pageMakers;
	}
	
	


}
