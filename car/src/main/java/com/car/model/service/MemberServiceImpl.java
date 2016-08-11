package com.car.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.MemberDao;
import com.car.model.dto.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	@Qualifier("mysqlMemberDao")
	private MemberDao memberDao;
	
	@Override
	public void insertMember(Member member) {
		
		memberDao.insertMember(member);
		
	}

	@Override
	public Member selectMemberByIdAndPassWd(String memberId, String passWd) {
	
		return memberDao.selectMemberByIdAndPassword(memberId, passWd);
	}

	



}
