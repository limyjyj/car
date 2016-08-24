package com.car.model.service;

import java.util.List;

import com.car.model.dto.Fuel;
import com.car.model.dto.Outcome;

public interface FuelService {

	public void insertFuel(Fuel fuel);

	List<Fuel> selectFuelByMemberNo(int memberNo);
	
	List<Fuel> selectFuelByCarindex(int carindex);
	
	Fuel selectFuelByHistoryNo(int historyNo);
	
	public void updateFuel(Fuel fuel);

	void deletedFuel(Fuel fuel);

	
}
