package com.car.model.service;

import java.util.List;

import com.car.model.dto.GroupChat;


public interface GroupChatService {
	
	void insertGroupChat(GroupChat groupChat);
	
	public List<GroupChat> selectAllGroupChat();
	
	GroupChat selectGroupChatByMemberId(String memberId);
	
	GroupChat selectGroupChatByGroupChatNo(int groupChatNo);
	
	void updateGroupChat(GroupChat groupChat);	
	
	void deleteGroupChat(int groupChatNo);

}
