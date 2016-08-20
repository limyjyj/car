package com.car.model.dao;

import java.util.List;

import com.car.model.dto.Fuel;


public interface FuelDao {

	void insertFuel(Fuel fuel);
			
	List<Fuel> selectFuelByMemberNo(int memberNo);
	
	List<Fuel> selectFuelByCarindex(int carindex);
	
	void updateFuel(Fuel fuel);
}