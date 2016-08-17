package com.car.model.service;

import java.util.List;

import com.car.model.dto.Car;

public interface CarService {

	void insertCar(Car car);
	List<Car> selectCars(int carindex);
	
	List<Car> selectAllCarByCarno(int memberNo);
	Car selectCarnoByCarindex(int carindex);
	Car selectCarByCarno(String carno);
	void updateCar(Car car);
	void deleteCar(Car car);
}
