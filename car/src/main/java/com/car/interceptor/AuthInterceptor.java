package com.car.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(
			HttpServletRequest req, HttpServletResponse resp,
			Object handler) throws Exception {
		
		/*HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("loginuser");
		
		String url = req.getRequestURI();
		
		boolean redirect = false;
		
		if(url.contains("/member/list")){
			if(member != null && member.getUserType().toLowerCase().equals("admin")){
			}else{
				redirect = true;
			}
		}else if(url.contains("/board/") || url.contains("/upload/")){
			if(member != null){
			}else{
				redirect = true;
			}
		}
		
		if(redirect){
			resp.sendRedirect("/teamfive/account/login.action");
			return false;
		}else{
			return true;
		}*/
		
		return true;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	
	}

	
}
