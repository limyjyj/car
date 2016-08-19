package com.car.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.car.model.dto.Member;

public class AuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {

		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("loginuser");
		boolean redirect = false;

		String url = req.getRequestURI();

		if (url.contains("/member/")) {
			if (member != null) {

			} else {
				redirect = true;
			}
		} else if (url.contains("/board/") || url.contains("/car/car/") || url.contains("/carhistory/")
				|| url.contains("/fuel/") || url.contains("/groupchat/") || url.contains("/groupschedule/")
				|| url.contains("/outcome/") || url.contains("/reservation/")) {
			if (member != null) {
			} else {
				redirect = true;
			}
		}
		
		if (redirect) {
			resp.sendRedirect("/car/account/login.action");
			return false;
		} else {
			return true;
		}

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
