package com.car.model.service;


import com.car.model.dto.Member;

public interface MemberService {

	void insertMember(Member member);
	Member selectMemberByIdAndPasswd(String memberId, String passWd);
	
}



