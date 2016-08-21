package com.car.model.dao;

import java.util.Date;
import java.util.List;

import com.car.model.dto.Car;

public interface CarDao {

	void insertCar(Car car);
	List<Car> selectCars(int carindex);
	
	List<Car> selectAllCarByCarno(int memberNo);
	Car selectCarnoByCarindex(int carindex);
	Car selectCarByCarindex(int carindex);
	int selectCountFuelByRegdate(Date startDate, Date endDate);
	void updateCar(Car car);
	void deleteCar(Car car);
	int selectTotalOutcomeByCarindex(int carindex);
	List<Car> selectCarindexByMemberno(int memberNo);
}
