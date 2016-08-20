package com.car.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.MysqlGroupChatDao;
import com.car.model.dto.GroupChat;


@Service("groupChatService")
public class GroupChatServiceImpl implements GroupChatService {
	
	@Autowired
	@Qualifier("mysqlGroupChatDao")
	private MysqlGroupChatDao mysqlGroupChatDao;

	@Override
	public void insertGroupChat(GroupChat groupChat) {
		
		mysqlGroupChatDao.insertGroupChat(groupChat);
		
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

	@Override
	public void insertGroupChatStatement(int memberNo, int chatNo) {
		mysqlGroupChatDao.insertGroupChatStatement
		
	}

}
