package com.car.model.mapper;


import java.util.HashMap;

import com.car.model.dto.Member;

public interface MemberMapper {

	void insertMember(Member member);
	
	Member selectMemberByIdAndPassWd(HashMap<String, Object> params);
	
}



