package com.camper.profile.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camper.lib.utils.Criteria;
import com.camper.profile.service.ProfileService;

@Controller
public class ProfileController {

	@Autowired ProfileService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
		
	//회원 프로필 불러오기+페이징
	@RequestMapping (value = "/profile", method = RequestMethod.GET)
    public ModelAndView profileView(HttpSession session, HttpServletRequest request, @RequestParam String mb_id, @RequestParam HashMap<String, Object> params, Criteria cri) {
		HttpSession session1 = request.getSession();		
		session1.setAttribute("mb_id", mb_id);
						
		String loginId = (String) session.getAttribute("loginId");
		
		params.put("loginId", loginId);
		params.put("mb_id", mb_id);
		logger.info(params + "프로필 요청");
		
    	return service.profileView2(cri, params);	
    }
	
	
 
	//회원 프로필 불러오기
	//	@RequestMapping (value = "/profile", method = RequestMethod.GET)
	//    public ModelAndView profileView(HttpSession session, @RequestParam String mb_id) {
	//		logger.info(mb_id + "프로필 요청");
	//		String loginId = (String) session.getAttribute("loginId");
				
	//    	return service.profileView(loginId, mb_id);	
	//    }
	
	
	
	//신고하기 창 불러오기
	@RequestMapping (value = "/report", method = RequestMethod.GET)
	public ModelAndView report(HttpSession session, @RequestParam String mb_id) {
		logger.info(mb_id + "신고 요청");
		String loginId = (String) session.getAttribute("loginId");
		
		
	    return service.report(loginId, mb_id);		
	  }
	
	
	//신고하기
	 @RequestMapping(value = "/report.do")
	   public String write(MultipartFile[] photos, @RequestParam HashMap<String, String> params, 
	         HttpServletRequest session,  Model model){
	       
	      logger.info("첨부파일" + photos);
	      logger.info("param : {}",params);
	      
	      
	      service.reportDo(photos, params);
	      
	  
	      return "/mypage/popupClose";
	   }

		
	
	//차단하기
	@RequestMapping(value = "/MemberBlock.do", method = RequestMethod.GET)
	public ModelAndView MemberBlock(HttpSession session, @RequestParam String mb_id) {
		logger.info("차단 요청" + mb_id);
		String loginId = (String) session.getAttribute("loginId");
		//String loginId= "uihwan91";		
		return service.MemberBlock(mb_id, loginId);
		
	}
	
	
	
	//차단해제
		@RequestMapping(value = "/MemberBlockDelete.do", method = RequestMethod.GET)
		public ModelAndView MemberBlockDelete(HttpSession session, @RequestParam String mb_id) {
			logger.info("차단 해제" + mb_id);
			String loginId = (String) session.getAttribute("loginId");
			//String loginId= "uihwan91";
			logger.info("확인용" + mb_id + loginId);
			return service.MemberBlockDelete(mb_id, loginId);
			
		}
				
	
	
}
