package com.car.model.dao;

import java.util.List;
import com.car.model.dto.GroupChat;


public interface GroupChatDao {

	void createGroupChat(GroupChat groupChat);

	public List<GroupChat> selectAllGroupChat();

	GroupChat selectGroupChatByMemberId(String memberId);
	
	GroupChat selectGroupChatByGroupChatNo(int groupChatNo);

	void updateGroupChat(GroupChat groupChat);
	
	void deleteGroupChat(int groupChatNo);
	
}