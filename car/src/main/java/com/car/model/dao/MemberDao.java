package com.car.model.dao;

import com.car.model.dto.Member;

public interface MemberDao {

	void insertMember(Member member);
	Member selectMemberByIdAndPasswd(String memberId, String passWd);
	void updateMember(Member member);
	void deleteMember(String memberId);
	Member selectMemberByMemberId(String memberId);
	

}