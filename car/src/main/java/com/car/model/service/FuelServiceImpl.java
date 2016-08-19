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
	public void updateFuel(Fuel fuel) {
		fuelDao.updateFuel(fuel);
	}

}
