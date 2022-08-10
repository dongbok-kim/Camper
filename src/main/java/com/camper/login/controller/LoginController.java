package com.camper.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camper.login.dto.LoginDTO;
import com.camper.login.service.LoginService;

@Controller
public class LoginController {

	@Autowired LoginService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//로그인 페이지 이동
	@RequestMapping(value = "/login.go")
	public String loginPage(Model model) {
		
		return "login/login";
	}
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/join.go")
	public String JoinPage(Model model) {
			
		return "login/join";
	}
		
	//아이디 찾기 페이지 이동
	@RequestMapping(value = "/idFind.go")
	public String IdFindPage(Model model) {
			
		return "login/idfind";
	}
		
	//비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/pwFind.go")
	public String PWFindPage(Model model) {
			
		return "login/pwfind";
	}
	
	//로그인
	@RequestMapping(value = "/login.do")
	public String login(Model model, HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String loginId = service.login(id, pw);
		
		String msg = "아이디 혹은 비번이 틀렸습니다";
		String page = "login/login";
		
		if(loginId != null ) {
			HttpSession session = request.getSession();
			session.setAttribute("loginId", loginId);
			msg = loginId + "님 환영합니다";			
			page = "redirect:/main";			
		} else {			
			model.addAttribute("msg", msg);
			logger.info("로그인 실패");
		}
		
		return page;
	}
	
	
	//회원가입
	@RequestMapping(value = "/join.do")
	public ModelAndView join(Model model, @ModelAttribute LoginDTO dto) {
		
		logger.info("id : "+dto.getMb_id());
		logger.info("pw : "+dto.getMb_pw());
		logger.info("email : "+dto.getMb_email());
		logger.info("nickname : "+dto.getMb_nickname());
		logger.info("name : "+dto.getMb_name());
		logger.info("gender : "+dto.getMb_gender());
		logger.info("age : "+dto.getMa_idx());
		logger.info("postcode : "+dto.getMb_postcode());
		logger.info("addr : "+dto.getMb_addr_default());
		logger.info("detailaddr : "+dto.getMb_addr_detail());
		logger.info("sido : "+dto.getMb_sido());
		logger.info("sigungu : "+dto.getMb_sigungu());
		
		return service.join(dto);
	}
	
	
	//아이디 중복 체크
	@RequestMapping("/doubleCheckId.ajax")
	@ResponseBody
	public HashMap<String, Object> doubleCheckId(@RequestParam String chkId) {
				
	logger.info("아이디 중복 체크 : "+chkId);
	return service.doubleCheckId(chkId);
	}
	
	//이메일 중복 체크
	@RequestMapping("/doubleCheckEmail.ajax")
	@ResponseBody
	public HashMap<String, Object> doubleCheckEmail(@RequestParam String chkEmail) {
					
	logger.info("이메일 중복 체크 : "+chkEmail);
	return service.doubleCheckEmail(chkEmail);
	}
		
	//닉네임 중복 체크
	@RequestMapping("/doubleCheckNickname.ajax")
	@ResponseBody
	public HashMap<String, Object> doubleCheckNickname(@RequestParam String chkNickname) {
						
	logger.info("닉네임 중복 체크 : "+chkNickname);
	return service.doubleCheckNickname(chkNickname);
	}
	
	
}
