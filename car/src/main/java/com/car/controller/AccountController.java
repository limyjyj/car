package com.car.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.car.common.Util;
import com.car.model.dto.Member;
import com.car.model.service.MemberService;

@Controller
@RequestMapping(value = "/account")
public class AccountController {


	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;


	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String loginForm() {
		
		return "account/loginform";
		// /WEB-INF/views/ + account/loginform + .jsp
	}

	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	@ResponseBody
	public String login( String memberId, String passWd, HttpSession session ) {
		
		passWd = Util.getHashedString(passWd, "SHA-256");
		
		Member member = memberService.selectMemberByIdAndPassWd(memberId, passWd);
		
		if (member != null) {
			// 세션에 로그인 정보 저장
			session.setAttribute("loginuser", member);

			return "fail";
		} else {
			return "success";
		}

	}
	
	
	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.removeAttribute("loginuser");// 로그아웃
		return "redirect:/home.action";
	}
	
	
	/*
	 @RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String facebookLogin(String userid, HttpSession session){
		
		
		return "redirect:/home.action";
	}
*/
		
			/*
			 Member member2 = memberService.login(id, passwd);
			if(member2 == null){
				Staff staff2 = memberService.stafflogin(id, passwd);
				if(staff2 != null){
					//관리자 로그인 처리
					session.setAttribute("loginuser", staff2);
				}else{
					return "account/loginform";
					//로그인 실패 처리
				}
			}else{
				//사용자 로그인 처리
				session.setAttribute("loginuser", member2);
			}
			
			return "redirect:/home.action";
			*/
		

	
}

	


