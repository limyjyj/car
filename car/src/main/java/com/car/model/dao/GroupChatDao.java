package com.car.model.dao;

import java.util.List;

import com.car.model.dto.GroupChat;
import com.car.model.dto.GroupChatStatement;


public interface GroupChatDao {

	void insertGroupChat(GroupChat groupChat);

	public List<GroupChat> selectAllGroupChat();

	GroupChat selectGroupChatByMemberId(String memberId);
	
	GroupChat selectGroupChatByGroupChatNo(int groupChatNo);

	void updateGroupChat(GroupChat groupChat);
	
	void deleteGroupChat(int groupChatNo);
	
	void insertGroupChatStatement(GroupChatStatement groupChatStatement);
	
}