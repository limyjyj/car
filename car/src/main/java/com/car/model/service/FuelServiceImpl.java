package com.car.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.FuelDao;
import com.car.model.dto.Fuel;
import com.car.model.dto.Outcome;

@Service("fuelService")
public class FuelServiceImpl implements FuelService {

	@Autowired
	@Qualifier("mysqlFuelDao")
	private FuelDao fuelDao;

	@Override
	public void insertFuel(Fuel fuel) {
		fuelDao.insertFuel(fuel);
	}

	@Override
	public List<Fuel> selectFuelByMemberNo(int memberNo) {
		return fuelDao.selectFuelByMemberNo(memberNo);
	}

	@Override
	public List<Fuel> selectFuelByCarindex(int carindex) {
		return fuelDao.selectFuelByCarindex(carindex);
	}
	
	@Override
	public Fuel selectFuelByHistoryNo(int historyNo) {
		return fuelDao.selectFuelByHistoryNo(historyNo);
	}
	
	@Override
	public void updateFuel(Fuel fuel) {
		fuelDao.updateFuel(fuel);
	}

	@Override
	public void deletedFuel(Fuel fuel) {
		fuelDao.deletedFuel(fuel);
	}

	@Override
	public List<Fuel> selectFuelSearchType(String category) {
		return fuelDao.selectFuelSearchType(category);
	}

	

}
