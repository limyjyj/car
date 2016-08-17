package com.car.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.OutcomeDao;
import com.car.model.dto.Outcome;

@Service("outcomeService")
public class OutcomeServiceImpl implements OutcomeService {

	@Autowired
	@Qualifier("mysqlOutcomeDao")
	private OutcomeDao outcomeDao;

	@Override
	public void insertOutcome(Outcome outcome) {
		outcomeDao.insertOutcome(outcome);
	}

	@Override
	public List<Outcome> selectOutcomeList() {
		return outcomeDao.selectOutcomeList();
	}

	@Override
	public Outcome selectOutcomeByOutcomeNo(int outcomeNo) {
		return outcomeDao.selectOutcomeByOutcomeNo(outcomeNo);
	}

	@Override
	public void updateOutcome(Outcome outcome) {
		outcomeDao.updateOutcome(outcome);
	}
	

}
