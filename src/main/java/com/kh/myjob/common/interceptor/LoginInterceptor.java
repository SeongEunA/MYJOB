package com.kh.myjob.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		HttpSession session = request.getSession();
		
		Object result = session.getAttribute("loginInfo");
		
		if(result == null) {
			response.sendRedirect("/member/login");
			return false;
		}
		return true;
	}

	
	 
}
