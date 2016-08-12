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
	public Member selectMemberByIdAndPasswd(String memberId, String passWd) {
	
		return memberDao.selectMemberByIdAndPasswd(memberId, passWd);
	}

	@Override
	public void updateMember(Member member) {
		
		memberDao.updateMember(member);
		
	}

	@Override
	public void deleteMember(String memberId) {

		memberDao.deleteMember(memberId);
	}

	@Override
	public Member selectMemberByMemberId(String memberId) {
		
		return memberDao.selectMemberByMemberId(memberId);
	}

	



}
