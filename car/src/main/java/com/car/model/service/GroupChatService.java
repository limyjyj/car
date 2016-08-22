package com.car.model.service;

import java.util.List;

import com.car.model.dto.GroupChat;
import com.car.model.dto.GroupChatStatement;


public interface GroupChatService {
	
	void insertGroupChat(GroupChat groupChat);
	
	public List<GroupChat> selectAllGroupChat();
	
	GroupChat selectGroupChatByMemberId(String memberId);
	
	GroupChat selectGroupChatByGroupChatNo(int groupChatNo);
	
	GroupChat selectGroupChatByReservationNo(int reservationNo);
	
	void updateGroupChat(GroupChat groupChat);	
	
	void deleteGroupChat(int groupChatNo);
	
	void insertGroupChatStatement(GroupChatStatement groupChatStatement);
	
	GroupChatStatement selectGroupChatStatementByMemberNo(int memberNo);

}
