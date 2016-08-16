package com.car.model.dao;

import java.util.List;

import com.car.model.dto.Fuel;


public interface FuelDao {

	void insertFuel(Fuel fuel);
	
	List<Fuel> selectFuelList();
	
	Fuel selectFuelByFuelNo(int fuelNo);
	
	void updateFuel(Fuel fuel);
	
}