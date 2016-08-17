package com.car.model.service;

import java.util.List;

import com.car.model.dto.Fuel;

public interface FuelService {

	public void insertFuel(Fuel fuel);

	List<Fuel> selectFuelList();

	Fuel selectFuelByFuelNo(int fuelNo);

	public void updateFuel(Fuel fuel);

}
