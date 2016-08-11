package com.car.model.mapper;


import com.car.model.dto.Member;

public interface MemberMapper {

	void insertMember(Member member);
	
	Member selectMemberByEmailAndPassWd(String memberId, String passWd);
	
}



