package com.car.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.MysqlGroupScheduleDao;
import com.car.model.dto.GroupSchedule;


@Service("groupScheduleService")
public class GroupScheduleServiceImpl implements GroupScheduleService {
	
	@Autowired
	@Qualifier("mysqlGroupScheduleDao")
	private MysqlGroupScheduleDao mysqlGroupScheduleDao;

	@Override
	public void insertGroupSchedule(GroupSchedule groupSchedule) {
		
		mysqlGroupScheduleDao.insertGroupSchedule(groupSchedule);
		
	}

	@Override
	public List<GroupSchedule> selectAllGroupSchedule() {
		
		return mysqlGroupScheduleDao.selectAllGroupSchedule();
	}

	@Override
	public GroupSchedule selectGroupScheduleByMemberId(String memberId) {
		
		return mysqlGroupScheduleDao.selectGroupScheduleByMemberId(memberId);
	}

	@Override
	public GroupSchedule selectGroupScheduleByGroupScheduleNo(int groupScheduleNo) {
		
		return mysqlGroupScheduleDao.selectGroupScheduleByGroupScheduleNo(groupScheduleNo);
	}

	@Override
	public void updateGroupSchedule(GroupSchedule groupSchedule) {
		
		mysqlGroupScheduleDao.updateGroupSchedule(groupSchedule);
		
	}

	@Override
	public void deleteGroupSchedule(int groupScheduleNo) {
		
		mysqlGroupScheduleDao.deleteGroupSchedule(groupScheduleNo);
		
	}

	@Override
	public GroupSchedule selectGroupScheduleByChatNo(int chatNo) {
		
		return mysqlGroupScheduleDao.selectGroupScheduleByChatNo(chatNo);
	}
	

}
