package com.car.model.service;

import java.util.Date;
import java.util.List;

import com.car.model.dto.Car;

public interface CarService {

	void insertCar(Car car);
	List<Car> selectCars(int carindex);
	
	List<Car> selectAllCarByCarno(int memberNo);
	Car selectCarnoByCarindex(int carindex);
	Car selectCarByCarindex(int carindex);
	void updateCar(Car car);
	void deleteCar(Car car);
	int selectTotalOutcomeByCarindex(int carindex);
	List<Car> selectCarindexByMemberno(int memberNo);
	int selectCountFuelByRegdate(Date startDate, Date endDate, int carindex);
	int selectTotalFuelByRegdate(Date startDate, Date endDate, int carindex);
	int selectTotalRepairByCategory(Date startDate, Date endDate, int carindex);
	int selectTotalMaintainByCategory(Date startDate, Date endDate, int carindex);
}
