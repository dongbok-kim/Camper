package com.camper.lib.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MypgValidationInter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		String loginId = (String) session.getAttribute("loginId");
		boolean pass = true;
		
		if (loginId == null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>alert('로그인이 필요한 서비스입니다.'); location.href='/login.go';</script>");
			out.flush();
			out.close();
			// response.sendRedirect("/login.go");
			pass = false;
		}
		
		
		return pass;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) {
		
	}

}
