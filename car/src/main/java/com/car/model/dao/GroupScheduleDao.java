package com.car.model.dao;

import java.util.List;

import com.car.model.dto.GroupSchedule;


public interface GroupScheduleDao {

	void insertGroupSchedule(GroupSchedule groupSchedule);
	
	public List<GroupSchedule> selectAllGroupSchedule();
	
	GroupSchedule selectGroupScheduleByMemberId(String memberId);
	
	GroupSchedule selectGroupScheduleByGroupScheduleNo(int groupScheduleNo);
	
	void updateGroupSchedule(GroupSchedule groupSchedule);	
	
	void deleteGroupSchedule(int groupScheduleNo);
	
}