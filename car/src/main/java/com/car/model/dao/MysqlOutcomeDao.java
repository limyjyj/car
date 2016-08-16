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
	public List<Outcome> selectOutcomeList() {
		return outcomeMapper.selectOutcomeList();
	}

	@Override
	public Outcome selectOutcomeByOutcomeNo(int outcomeNo) {
		return outcomeMapper.selectOutcomeByOutcomeNo(outcomeNo);
	}

	@Override
	public void updateOutcome(Outcome outcome) {
		outcomeMapper.updateOutcome(outcome);
	}

}
