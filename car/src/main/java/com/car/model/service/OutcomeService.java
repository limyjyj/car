package com.car.model.service;

import java.util.List;

import com.car.model.dto.Outcome;

public interface OutcomeService {

	public void insertOutcome(Outcome outcome);

	List<Outcome> selectOutcomeList();
	
	Outcome selectOutcomeByOutcomeNo(int outcomeNo);
	
	public void updateOutcome(Outcome outcome);
	
}
