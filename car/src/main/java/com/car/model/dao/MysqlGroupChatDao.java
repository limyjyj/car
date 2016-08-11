package com.car.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.car.model.dto.GroupChat;
import com.car.model.mapper.GroupChatMapper;


@Repository(value = "mysqlGroupChatDao")
public class MysqlGroupChatDao implements GroupChatDao {
	
	@Autowired
	@Qualifier("groupChatMapper")
	private GroupChatMapper groupChatMapper;

	@Override
	public void createGroupChat(GroupChat groupChat) {
		
		groupChatMapper.createGroupChat(groupChat);
		
	}

	@Override
	public List<GroupChat> selectAllGroupChat() {
		
		return groupChatMapper.selectAllGroupChat();
	}

	@Override
	public GroupChat selectGroupChatByMemberId(String memberId) {
		
		return groupChatMapper.selectGroupChatByMemberId(memberId);
	}

	@Override
	public GroupChat selectGroupChatByGroupChatNo(int groupChatNo) {
		
		return groupChatMapper.selectGroupChatByGroupChatNo(groupChatNo);
	}

	@Override
	public void updateGroupChat(GroupChat groupChat) {
		
		groupChatMapper.updateGroupChat(groupChat);
		
	}

	@Override
	public void deleteGroupChat(int groupChatNo) {
		
		groupChatMapper.deleteGroupChat(groupChatNo);
		
	}
	
	
	
	
}