package com.car.model.dao;

import java.util.List;

import com.car.model.dto.Fuel;


public interface FuelDao {

	void insertFuel(Fuel fuel);
			
	List<Fuel> selectFuelByMemberNo(int memberNo);
	
	List<Fuel> selectFuelByCarindex(int carindex);
	
	Fuel selectFuelByHistoryNo(int historyNo);
	
	void updateFuel(Fuel fuel);
	
	void deletedFuel(Fuel fuel);

	List<Fuel> selectFuelSearchType(String category);

	
}