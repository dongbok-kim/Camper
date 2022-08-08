package com.camper.login.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String join(Model model, HttpServletRequest request) {
		
		String id = request.getParameter("id"); //아이디
		String pw = request.getParameter("password"); //비밀번호
		String pwchk =  request.getParameter("passwordcheck"); //비밀번호 확인
		String email = request.getParameter("email"); //이메일
		String nickname = request.getParameter("nickname"); //닉네임
		String name = request.getParameter("name"); //이름
		String gender = request.getParameter("gender"); //성별
		String age = request.getParameter("age"); //연령대
		String postcode = request.getParameter("sample6_postcode"); //우편번호
		String addr = request.getParameter("sample6_address"); //주소
		String detailaddr = request.getParameter("sample6_detailAddress"); //상세주소
		String sido = request.getParameter("sample6_sido"); // 시/도
		String sigungu = request.getParameter("sample6_sigungu"); // 시/군/구
		
		logger.info("id : "+id);
		logger.info("pw : "+pw);
		logger.info("pwchk : "+pwchk);
		logger.info("email : "+email);
		logger.info("nickname : "+nickname);
		logger.info("name : "+name);
		logger.info("gender : "+gender);
		logger.info("age : "+age);
		logger.info("postcode : "+postcode);
		logger.info("addr : "+addr);
		logger.info("detailaddr : "+detailaddr);
		logger.info("sido : "+sido);
		logger.info("sigungu : "+sigungu);
		
		String msg = "아이디 혹은 비번이 틀렸습니다";
		String page = "login/join";
		
		return page;
	}
	
	
	
	
	
	
	
}
