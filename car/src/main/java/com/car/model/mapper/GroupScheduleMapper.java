package com.car.model.mapper;

import java.util.List;

import com.car.model.dto.GroupSchedule;


public interface GroupScheduleMapper {
	
	void insertGroupSchedule(GroupSchedule groupSchedule);
	public List<GroupSchedule> selectAllGroupSchedule();
	GroupSchedule selectGroupScheduleByMemberId(String memberId);
	GroupSchedule selectGroupScheduleByGroupScheduleNo(int groupScheduleNo);
	GroupSchedule selectGroupScheduleByChatNo(int chatNo);
	void updateGroupSchedule(GroupSchedule groupSchedule);	
	void deleteGroupSchedule(int groupScheduleNo);

}
