package com.car.model.service;

import java.util.List;

import com.car.model.dto.Car;

public interface CarService {

	void insertCar(Car car);
	List<Car> selectCars();
	
	List<Car> selectAllCarByCarno(int memberNo);
	Car selectCarnoByCarindex(int carindex);

	void updateCar(Car car);
}
