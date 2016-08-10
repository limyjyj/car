package com.car.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.car.model.dao.CarDao;
import com.car.model.dto.Car;

public class CarServiceImpl implements CarService {

	@Autowired
	@Qualifier("oracleReservationDao")
	private CarDao carDao;

	@Override
	public void insertCar(Car car) {
		carDao.insertCar(car);
	}
}
