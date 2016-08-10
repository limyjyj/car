package com.car.model.dao;

import java.util.HashMap;

import com.car.model.dto.Member;

public interface MemberDao {

	void insertMember(Member member);
	Member selectMemberByIdAndPassword(String memberId, String passWd);
	

}