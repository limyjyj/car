package com.car.model.mapper;

import java.util.List;

import com.car.model.dto.Fuel;

public interface FuelMapper {

	void insertFuel(Fuel fuel);

	List<Fuel> selectFuelByMemberNo(int memberNo);

	List<Fuel> selectFuelByCarindex(int carindex);

	Fuel selectFuelByHistoryNo(int historyNo);

	public void updateFuel(Fuel fuel);

	void deletedFuel(Fuel fuel);

	
}
