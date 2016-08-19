package com.car.model.dao;

import java.util.List;

import com.car.model.dto.Outcome;


public interface OutcomeDao {

	void insertOutcome(Outcome outcome);
	
	List<Outcome> selectOutcomeByMemberNo(int memberNo);
	
	List<Outcome> selectOutcomeByCarindex(int carindex);
	
	void updateOutcome(Outcome outcome);
	
	List<Outcome> selectOutcomeByHistoryNo(int historyNo);
	
}