package com.car.model.mapper;

import java.util.List;

import com.car.model.dto.Car;

public interface CarMapper {

	void insertCar(Car car);
	List<Car> selectCars();
	
	List<Car> selectAllCarByCarno(int memberNo);
	Car selectCarnoByCarindex(int carindex);
	Car selectCarByCarno(String carno);
	void updateCar(Car car);
	void deleteCar(Car car);
	List<Car> selectCarByMemberno(int memberno);
}
