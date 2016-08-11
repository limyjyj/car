package com.car.model.dao;

import java.util.List;

import com.car.model.dto.Car;

public interface CarDao {

	void insertCar(Car car);
	public List<Car> selectCars();
	
	Car selectCarByCarno(int carno);
}