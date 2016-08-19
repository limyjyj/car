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
	public List<Outcome> selectOutcomeByMemberNo(int memberNo) {
		return outcomeDao.selectOutcomeByMemberNo(memberNo);
	}

	@Override
	public List<Outcome> selectOutcomeByCarindex(int carindex) {
		return outcomeDao.selectOutcomeByCarindex(carindex);
	}
	
	@Override
	public void updateOutcome(Outcome outcome) {
		outcomeDao.updateOutcome(outcome);
	}
	

}
