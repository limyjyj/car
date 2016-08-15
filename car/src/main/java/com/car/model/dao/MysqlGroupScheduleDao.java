package com.car.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.car.model.dto.GroupSchedule;
import com.car.model.mapper.GroupScheduleMapper;


@Repository(value = "mysqlGroupScheduleDao")
public class MysqlGroupScheduleDao implements GroupScheduleDao {
	
	@Autowired
	@Qualifier("groupScheduleMapper")
	private GroupScheduleMapper groupScheduleMapper;

	@Override
	public void insertGroupSchedule(GroupSchedule groupSchedule) {
		
		groupScheduleMapper.insertGroupSchedule(groupSchedule);
		
	}

	@Override
	public List<GroupSchedule> selectAllGroupSchedule() {
		
		return groupScheduleMapper.selectAllGroupSchedule();
	}

	@Override
	public GroupSchedule selectGroupScheduleByMemberId(String memberId) {
		
		return groupScheduleMapper.selectGroupScheduleByMemberId(memberId);
	}

	@Override
	public GroupSchedule selectGroupScheduleByGroupScheduleNo(int groupScheduleNo) {
		
		return groupScheduleMapper.selectGroupScheduleByGroupScheduleNo(groupScheduleNo);
	}

	@Override
	public void updateGroupSchedule(GroupSchedule groupSchedule) {
		
		groupScheduleMapper.updateGroupSchedule(groupSchedule);
		
	}

	@Override
	public void deleteGroupSchedule(int groupScheduleNo) {
		
		groupScheduleMapper.deleteGroupSchedule(groupScheduleNo);
		
	}
	
}