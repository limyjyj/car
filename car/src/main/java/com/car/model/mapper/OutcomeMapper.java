package com.car.model.mapper;

import java.util.List;

import com.car.model.dto.Outcome;

public interface OutcomeMapper {

	void insertOutcome(Outcome outcome);
	
	List<Outcome> selectOutcomeByMemberNo(int memberNo);
	
	List<Outcome> selectOutcomeByCarindex(int carindex);
	
	void updateOutcome(Outcome outcome);
		
}
