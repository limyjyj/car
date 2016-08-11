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
	public Member selectMemberByIdAndPassWd(String memberId, String passWd) {
		
		Member member = memberMapper.selectMemberByIdAndPassWd(memberId, passWd);
		return member;
		
	}

	
}
