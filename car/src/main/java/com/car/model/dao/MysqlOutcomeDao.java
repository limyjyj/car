package com.car.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.car.model.dto.Outcome;
import com.car.model.mapper.OutcomeMapper;

@Repository(value = "mysqlOutcomeDao")
public class MysqlOutcomeDao implements OutcomeDao {

	@Autowired
	@Qualifier("outcomeMapper")
	private OutcomeMapper outcomeMapper;

	@Override
	public void insertOutcome(Outcome outcome) {
		outcomeMapper.insertOutcome(outcome);
	}

	@Override
	public List<Outcome> selectOutcomeByMemberNo(int memberNo) {
		return outcomeMapper.selectOutcomeByMemberNo(memberNo);
	}

	@Override
	public List<Outcome> selectOutcomeByCarindex(int carindex) {		
		return outcomeMapper.selectOutcomeByCarindex(carindex);
	}

	@Override
	public void updateOutcome(Outcome outcome) {
		outcomeMapper.updateOutcome(outcome);
	}

	@Override
	public Outcome selectOutcomeByHistoryNo(int historyNo) {
		return outcomeMapper.selectOutcomeByHistoryNo(historyNo);
	}

	@Override
	public void deletedOutcome(Outcome outcome) {
		outcomeMapper.deletedOutcome(outcome);
	}
}
