package com.car.model.mapper;

import java.util.List;

import com.car.model.dto.Car;

public interface CarMapper {

	void insertCar(Car car);
	public List<Car> selectCars();
	
	Car selectCarByCarno(int carno);
}
