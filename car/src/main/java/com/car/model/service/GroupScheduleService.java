package com.car.model.service;

import java.util.List;

import com.car.model.dto.GroupSchedule;


public interface GroupScheduleService {
	
	void insertGroupSchedule(GroupSchedule groupSchedule);
	
	public List<GroupSchedule> selectAllGroupSchedule();
	
	GroupSchedule selectGroupScheduleByMemberId(String memberId);
	
	GroupSchedule selectGroupScheduleByGroupScheduleNo(int groupScheduleNo);
	
	void updateGroupSchedule(GroupSchedule groupSchedule);	
	
	void deleteGroupSchedule(int groupScheduleNo);

}
