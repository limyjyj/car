package com.car.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.car.common.Util;
import com.car.model.dto.Member;
import com.car.model.service.MemberService;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
//	@RequestMapping(
//		value = "list.action", method = RequestMethod.GET)
//	public String list(Model model) {
//		//1. 데이터 조회 (dao 사용)
//		List<Member> members = memberService.getAllMembers();
//		
//		//2. 데이터 저장 (jsp에서 사용할 수 있도록)
//		model.addAttribute("members", members);
//		
//		//3. 뷰 반환
//		return "member/list";
//	}
//	
//	@RequestMapping(
//		value = "view.action", method = RequestMethod.GET)
//	public String view(
//		@RequestParam("memberid") String memberId, Model model) {
//		
//		if (memberId == null || memberId.length() == 0) {
//			return "redirect:/member/list.action";
//		}
//		
//		Member member = memberService.searchMemberByMemberId(memberId);
//		model.addAttribute("member", member);
//		
//		return "member/view";
//	}
//	
	@RequestMapping(
		value = "register.action", method = RequestMethod.GET)
	public String registerForm(
		@ModelAttribute Member member) {
		return "member/registerform";
	}
	
	@RequestMapping(
		value = "register.action", method = RequestMethod.POST)
	public String register(@Valid @ModelAttribute Member member) {		
		
		

		member.setPassWd(Util.getHashedString(member.getPassWd(), "SHA-256"));
		
		
		memberService.insertMember(member);
		
		return "member/list";
		
	}
//	@RequestMapping(value= "editform2.action", method = RequestMethod.GET)
//	public String editform( @ModelAttribute String memberId){
//		memberService.searchMemberByMemberId2(memberId);
//		
//		return "member/editform2";
//		
//	}
//	@RequestMapping(
//			value = "editform.action", method = RequestMethod.POST)
//		public String edit(
//			Member member, BindingResult result) {		
//			if (result.hasErrors()) {
//				return "member/editform2";
//			}
//			
//			member.setPasswd(
//				Util.getHashedString(member.getPasswd(), "SHA-256"));
//			
//			
//			memberService.registerMember(member);
//			
//			return "redirect:/member/view.action";
//			
//		}	
	
}









