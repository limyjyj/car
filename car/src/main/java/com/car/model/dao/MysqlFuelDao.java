package com.car.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.car.model.dto.Fuel;
import com.car.model.mapper.FuelMapper;

@Repository(value = "mysqlFuelDao")
public class MysqlFuelDao implements FuelDao {

	@Autowired
	@Qualifier("fuelMapper")
	private FuelMapper fuelMapper;

	@Override
	public void insertFuel(Fuel fuel) {
		fuelMapper.insertFuel(fuel);
	}

	@Override
	public List<Fuel> selectFuelList() {
		return fuelMapper.selectFuelList();
	}

	@Override
	public Fuel selectFuelByFuelNo(int fuelNo) {
		return fuelMapper.selectFuelByFuelNo(fuelNo);
	}

	@Override
	public void updateFuel(Fuel fuel) {
		fuelMapper.updateFuel(fuel);
	}

}
