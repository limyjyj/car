package com.car.model.mapper;

import java.util.List;

import com.car.model.dto.Fuel;

public interface FuelMapper {

	void insertFuel(Fuel fuel);
	
	public List<Fuel> selectFuelList();
	
	Fuel selectFuelByFuelNo(int fuelNo);
	
	void updateFuel(Fuel fuel);
		
}
