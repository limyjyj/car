package com.car.model.mapper;

import java.util.List;

import com.car.model.dto.Fuel;
import com.car.model.dto.Outcome;

public interface FuelMapper {

	void insertFuel(Fuel fuel);
		
	List<Fuel> selectFuelByMemberNo(int memberNo);
	
	List<Fuel> selectFuelByCarindex(int carindex);

	void updateFuel(Fuel fuel);
		
}
