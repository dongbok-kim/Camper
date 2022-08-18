package com.camper.login.controller;

import java.util.HashMap;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	public String PwFindPage(Model model) {
			
		return "login/pwfind";
	}
	
	//로그인
	@RequestMapping(value = "/login.do")
	public String login(@RequestParam String id, @RequestParam String pw, Model model, HttpServletRequest request) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String loginPw = service.login(id);	//아이디를 이용해서 암호화된 비밀번호 찾기
		String mb_grade = service.mbgrade(id); //해당 아이디의 회원 권한 찾기
		String mb_status = service.mbstatus(id); // 해당 아이디의 회원 상태 찾기
		
		boolean match = encoder.matches(pw, loginPw); // 비밀번호 일치 여부
		
		String msg = "아이디 혹은 비번이 틀렸습니다";
		String page = "login/login";
		
		if(match == true ) { //일치여부 true 이면
			HttpSession session = request.getSession();
			logger.info("로그인 성공");
			session.setAttribute("loginId", id);	//아이디 세션에 저장
			
			logger.info("회원 권한 : "+mb_grade);	//회원 권한 세션에 저장 (회원, 관리자)
			session.setAttribute("mb_grade", mb_grade);
			
			logger.info("회원 상태 : "+mb_status);	//회원 상태 세션에 저장 (정상, 정지 , 탈퇴)
			session.setAttribute("mb_status", mb_status);
			
			//같은 방식으로 정지도 추가 해야됨 (+정지일수 표시?)
			if(mb_status.equals("탈퇴")) { //회원 상태가 탈퇴일때 세션 지우고 로그인 불가
				session.removeAttribute("loginId");
				session.removeAttribute("mb_grade");
				session.removeAttribute("mb_status");
				model.addAttribute("msg", "탈퇴된 회원 입니다.");
				page = "login/login";
			} else if(mb_status.equals("정지")) {
				session.removeAttribute("loginId");
				session.removeAttribute("mb_grade");
				session.removeAttribute("mb_status");
				model.addAttribute("msg", "정지중인 회원 입니다.");
				page = "login/login";
			} else {
				page = "redirect:/";
			}
		} else {	//아이디 비밀번호가 일치 하지 않을시		
			model.addAttribute("msg", msg);
			logger.info("로그인 실패");
		}
		
		return page;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout.do")
	public String Logout(Model model, HttpSession session) {	//세션들 지우기
		session.removeAttribute("loginId");		
		session.removeAttribute("mb_grade");
		session.removeAttribute("mb_status");
		model.addAttribute("msg", "로그아웃 되었습니다.");
		return "main";
	}
	
	//회원가입
	@RequestMapping(value = "/join.do")
	@ResponseBody
	public ModelAndView join(Model model, @ModelAttribute LoginDTO dto, HttpServletRequest request) {
		
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
	
	//아이디 찾기
	@RequestMapping(value = "/idFind.do")
	public String IdFind(Model model, @RequestParam String name, @RequestParam String email) {
			
		String page = "login/idfind";
		
		String idFind = service.idFind(name , email);
		
		if (idFind == null ) {
			model.addAttribute("msg", "이름 또는 이메일이 일치하지 않습니다.");
		} else {
			model.addAttribute("msg", "당신의 아이디 :  "+idFind);
		}
		
		return page;
	}
	
	
	//아이디, 비밀번호 확인
	@RequestMapping(value = "/pwFind.ajax")
	@ResponseBody
	public HashMap<String, Object> PwCheck(@RequestParam String mb_id , @RequestParam String mb_email) {
		
		logger.info("아이디 , 비밀번호 확인");
		return service.pwFind(mb_id, mb_email);
	}
	
	
		//비밀번호 재설정
		@RequestMapping(value = "/pwRework.do")
		public ModelAndView PwRework(Model model, @ModelAttribute LoginDTO dto) {
			
			logger.info("수정할 아이디 : "+dto.getMb_id());
			logger.info("수정할 pw : "+dto.getMb_pw());
			logger.info("수정할 이메일 : "+dto.getMb_email());
			
			return service.pwRework(dto);
		}
	
	
}
