package com.car.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.car.model.dao.MysqlGroupChatDao;
import com.car.model.dto.GroupChat;


public class GroupChatServiceImpl implements GroupChatService {
	
	@Autowired
	@Qualifier("mysqlGroupChatDao")
	private MysqlGroupChatDao mysqlGroupChatDao;

	@Override
	public void createGroupChat(GroupChat groupChat) {
		
		mysqlGroupChatDao.createGroupChat(groupChat);
		
	}

	@Override
	public List<GroupChat> selectAllGroupChat() {
		
		return mysqlGroupChatDao.selectAllGroupChat();
	}

	@Override
	public GroupChat selectGroupChatByMemberId(String memberId) {
		
		return mysqlGroupChatDao.selectGroupChatByMemberId(memberId);
	}

	@Override
	public GroupChat selectGroupChatByGroupChatNo(int groupChatNo) {
		
		return mysqlGroupChatDao.selectGroupChatByGroupChatNo(groupChatNo);
	}

	@Override
	public void updateGroupChat(GroupChat groupChat) {
		
		mysqlGroupChatDao.updateGroupChat(groupChat);
		
	}

	@Override
	public void deleteGroupChat(int groupChatNo) {
		
		mysqlGroupChatDao.deleteGroupChat(groupChatNo);
		
	}

}