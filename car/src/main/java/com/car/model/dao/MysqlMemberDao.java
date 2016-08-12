package com.car.model.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.car.model.dto.Member;
import com.car.model.mapper.MemberMapper;

@Repository("mysqlMemberDao")
public class MysqlMemberDao implements MemberDao {

	@Autowired
	@Qualifier("memberMapper")
	private MemberMapper memberMapper;
	
	@Override
	public void insertMember(Member member) {
		
		memberMapper.insertMember(member);
		
	}

	@Override
	public Member selectMemberByIdAndPasswd(String memberId, String passWd) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("memberId", memberId);
		param.put("passWd", passWd);
		Member member = memberMapper.selectMemberByIdAndPasswd(param);
		return member;
		
	}

	@Override
	public void updateMember(Member member) {

		memberMapper.updateMember(member);
	}

	@Override
	public void deleteMember(String memberId) {
		
		memberMapper.deleteMember(memberId);
	}

	@Override
	public Member selectMemberByMemberId(String memberId) {

		return memberMapper.selectMemberByMemberId(memberId);
	}

	
}
