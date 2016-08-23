package com.car.model.service;

import java.util.List;

import com.car.model.dto.Fuel;

public interface FuelService {

	public void insertFuel(Fuel fuel);

	List<Fuel> selectFuelByMemberNo(int memberNo);
	
	List<Fuel> selectFuelByCarindex(int carindex);
	
	Fuel selectFuelByHistoryNo(int historyNo);
	
	public void updateFuel(Fuel fuel);

}
