package com.car.model.service;

import java.util.List;

import com.car.model.dto.Outcome;

public interface OutcomeService {

	public void insertOutcome(Outcome outcome);
	
	List<Outcome> selectOutcomeByMemberNo(int memberNo);

	List<Outcome> selectOutcomeByCarindex(int carindex);
	
	Outcome selectOutcomeByHistoryNo(int historyNo);
	
	public void updateOutcome(Outcome outcome);
	
	;
	
}
