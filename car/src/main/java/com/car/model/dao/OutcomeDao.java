package com.car.model.dao;

import java.util.List;

import com.car.model.dto.Outcome;


public interface OutcomeDao {

	void insertOutcome(Outcome outcome);
	
	List<Outcome> selectOutcomeList();
	
	Outcome selectOutcomeByOutcomeNo(int outcomeNo);
	
	void updateOutcome(Outcome outcome);
	
}