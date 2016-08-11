package com.car.model.mapper;

import java.util.List;

import com.car.model.dto.Outcome;

public interface OutcomeMapper {

	void insertOutcome(Outcome outcome);
	
	public List<Outcome> selectOutcomeList();
	
	Outcome selectOutcomeByOutcomeNo(int outcomeNo);
	
	void updateOutcome(Outcome outcome);
		
}
