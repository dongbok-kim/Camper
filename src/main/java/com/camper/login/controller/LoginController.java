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
import org.springframework.scheduling.annotation.Scheduled;
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
	public String loginPage(Model model, HttpSession session, RedirectAttributes rttr) {
		
		String page = "login/login";
		
		session.removeAttribute("mb_id");
		
		if(session.getAttribute("loginId") != null ) {
			rttr.addFlashAttribute("msg", "로그인한 상태로 접근 불가 ");
			page = "redirect:/";
		}
		
		return page;
	}
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/join.go")
	public String JoinPage(Model model, HttpSession session, RedirectAttributes rttr) {
		
		String page = "login/join";
		
		if(session.getAttribute("loginId") != null ) {
			rttr.addFlashAttribute("msg", "로그인한 상태로 접근 불가 ");
			page = "redirect:/";
		}
		
		ArrayList<LoginDTO> list = service.joinAge();
		model.addAttribute("list", list);
		
		return page;
	}
		
	//아이디 찾기 페이지 이동
	@RequestMapping(value = "/idFind.go")
	public String IdFindPage(Model model, HttpSession session, RedirectAttributes rttr) {
		
		String page = "login/idfind";
		
		if(session.getAttribute("loginId") != null ) {
			rttr.addFlashAttribute("msg", "로그인한 상태로 접근 불가 ");
			page = "redirect:/";
		}
		
		return page;
	}
		
	//비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/pwFind.go")
	public String PwFindPage(Model model, HttpSession session, RedirectAttributes rttr) {
		
		String page = "login/pwfind";
		
		if(session.getAttribute("loginId") != null ) {
			rttr.addFlashAttribute("msg", "로그인한 상태로 접근 불가 ");
			page = "redirect:/";
		}
		
		return page;
	}
	
	
	//비밀번호 재설정 패이지 이동
	@RequestMapping(value = "/pwRework.go")
	public String PwReworkPage(Model model, HttpSession session, RedirectAttributes rttr) {
		
		String page = "login/pwRework";
		
		if(session.getAttribute("loginId") != null ) {
			rttr.addFlashAttribute("msg", "로그인한 상태로 접근 불가 ");
			page = "redirect:/";
		}
		
		if(session.getAttribute("mb_id") == null ) {
			rttr.addFlashAttribute("msg", "강제 페이지 진입 불가");
			page = "redirect:/login.go";
		}
		
		return page;
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
			
			//정지를 판단하는 기준
			//1. 회원상태가 정지
			//2. 정지테이블에서 해당 회원으로 정지시작일~정지종료일 데이터가 있는지 검사
			//3. 2번에서 카운트 0 -> 정지풀렸거나 당한 기록을 찾을 수 없다는 것이니까. 2번+회원상태가 정지인 경우
			
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
	public String Logout(Model model, HttpSession session, RedirectAttributes rttr) {	//세션들 지우기
		session.removeAttribute("loginId");		
		session.removeAttribute("mb_grade");
		session.removeAttribute("mb_status");
		rttr.addFlashAttribute("msg", "로그아웃 되었습니다.");
		return "redirect:/";
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
		
		// 아이디 입력했는지?(공백제거후)
		// 규칙이 맞는지?
		// 중복된 아이디가 있는지?
		// 이메일 입력했는지?(공백제거후)
		// 이메일 규칙이 맞는지?
		// 이메일 중복이 잇는지?
		// 닉네임 입력했는지?(공백제거후)
		// 닉네임 중복이 잇는지?
		// 이름, 성별, 연령대
		// 연령대가 실제로 DB 에 존재하는 연령대를 선택햇는지
		// 우편번호 입력(선택)했는지, 기본주소 입력(선택)되어있는지, 상세주소 입력했는지
		// 기본주소를 기반으로 시/도 와 시/군/구를 추출한다
		
		return service.join(dto);
	}
	
	
	//아이디 중복 체크
	@RequestMapping("/doubleCheckId.ajax")
	@ResponseBody
	public HashMap<String, Object> doubleCheckId(@RequestParam String chkId) {
				
		
		//아이디입력했는지(공백제거후)
		//아이디규칙이맞는지
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
	public String IdFind(Model model, @RequestParam String name, @RequestParam String email, RedirectAttributes rttr) {
			
		String page = "login/idfind";
		
		String idFind = service.idFind(name , email);
		
			
			if (idFind == null ) {
				model.addAttribute("msg", "이름 또는 이메일이 일치하지 않습니다.");
			} else {
				
				String mb_status = service.idFindstatus(name, email);
				logger.info("mb_status : "+mb_status);
				
				if(mb_status.equals("탈퇴")) {
					rttr.addFlashAttribute("msg" , "탈퇴된 회원입니다.");
					page = "redirect:/idFind.go";
				} else {
					rttr.addFlashAttribute("msg", "회원님의 아이디 :  "+idFind);
					page = "redirect:/login.go";
				}
				
			}
		
		return page;
	}
	
	
	//아이디, 비밀번호 확인
	@RequestMapping(value = "/pwFind.do")
	public String PwCheck(Model model, @RequestParam String mb_id , @RequestParam String mb_email, HttpSession session, RedirectAttributes rttr) {
		
		String page = "login/pwfind";
		
		logger.info("아이디 : "+mb_id);
		logger.info("이메일 : "+mb_email);
		
		int PwFind = service.pwFind(mb_id, mb_email);
		
		logger.info("PwFind : "+PwFind);
			
			if(PwFind > 0) {
				
				String mb_status = service.pwFindstatus(mb_id, mb_email);
				logger.info("mb_status : "+mb_status);
				
				if(mb_status.equals("탈퇴")) {
					rttr.addFlashAttribute("msg", "탈퇴된 회원 입니다");
					page = "redirect:/pwFind.go";
				} else {
					session.setAttribute("mb_id", mb_id);
					page = "redirect:/pwRework.go";
					// rttr.addFlashAttribute("msg", "비밀번호 변경 가능");
				}
					
			} else {
				model.addAttribute("msg", "아이디 또는 이메일이 일치하지 않습니다.");
				page = "login/pwfind";
			}

		return page; 
	}
	
	
		//비밀번호 재설정
		@RequestMapping(value = "/pwRework.do")
		public String PwRework(Model model, HttpSession session, RedirectAttributes rttr, @RequestParam String mb_pw) {
			
			String page = "login/pwRework";
			
			String mb_id = (String) session.getAttribute("mb_id");
			
			logger.info("비밀번호 재설정할 아이디 : "+mb_id);
			logger.info("mb_pw : "+mb_pw); 
			
			service.pwRework(mb_id, mb_pw);
			
			session.removeAttribute("mb_id");
			rttr.addFlashAttribute("msg", "비밀번호가 수정되었습니다.");
			
			page = "redirect:/login.go";
			
			return page;
		}
		
	
}
