package com.car.model.service;

import java.util.List;

import com.car.model.dto.Car;

public interface CarService {

	void insertCar(Car car);
	public List<Car> selectCars();
	
	Car selectCarByCarno(int carno);
}
