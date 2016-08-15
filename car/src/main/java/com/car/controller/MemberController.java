package com.car.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.car.common.Util;
import com.car.model.dto.Member;
import com.car.model.service.MemberService;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;

	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String registerForm(@ModelAttribute Member member) {
		return "member/registerform1";
	}

	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String register(@Valid @ModelAttribute Member member) {
		System.out.println(member.getMemberId());
		member.setPassWd(Util.getHashedString(member.getPassWd(), "SHA-256"));

		memberService.insertMember(member);

		return "redirect:../home.action";

	}

	@RequestMapping(value = "edit.action", method = RequestMethod.GET)
	public String editform(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("loginuser");
		member = memberService.selectMemberByMemberId(member.getMemberId());
		model.addAttribute("member", member);
		System.out.println(member.getMemberId());
		return "member/editform";
	}

	@RequestMapping(value = "edit.action", method = RequestMethod.POST)
	public String edit(Member member) {

		member.setPassWd(Util.getHashedString(member.getPassWd(), "SHA-256"));

		memberService.updateMember(member);

		return "redirect:../home.action";

	}

	@RequestMapping(value = "delete.action", method = RequestMethod.GET)
	public String delete(String memberId, HttpSession session) {
		System.out.println(memberId);
		memberService.deleteMember(memberId);
		session.removeAttribute("loginuser");// 로그아웃
		return "redirect:../home.action";

	}

}
