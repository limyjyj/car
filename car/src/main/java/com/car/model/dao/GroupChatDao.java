package com.car.model.dao;

import java.util.List;

import com.car.model.dto.GroupChat;


public interface GroupChatDao {

	void insertGroupChat(GroupChat groupChat);

	public List<GroupChat> selectAllGroupChat();

	GroupChat selectGroupChatByMemberId(String memberId);
	
	GroupChat selectGroupChatByGroupChatNo(int groupChatNo);

	void updateGroupChat(GroupChat groupChat);
	
	void deleteGroupChat(int groupChatNo);
	
	void insertGroupChatStatement(int memberNo, int chatNo);
	
}