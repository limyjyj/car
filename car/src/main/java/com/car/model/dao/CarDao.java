package com.car.model.dao;

import java.util.List;

import com.car.model.dto.Car;

public interface CarDao {

	void insertCar(Car car);
	List<Car> selectCars();
	
	Car selectCarByCarno(int carno);
	Car selectCarnoByCarindex(int carindex);

	void updateCar(Car car);
}
