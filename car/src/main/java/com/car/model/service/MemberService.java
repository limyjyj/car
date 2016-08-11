package com.car.model.service;


import java.util.HashMap;

import com.car.model.dto.Member;

public interface MemberService {

	void insertMember(Member member);
	Member selectMemberByIdAndPassWd(String memberId, String passWd);
	
}



