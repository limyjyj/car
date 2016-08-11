package com.car.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.car.model.dao.CarDao;
import com.car.model.dto.Car;
import com.car.model.dto.GroupChat;

public class CarServiceImpl implements CarService {

	@Autowired
	@Qualifier("MysqlCarDao")
	private CarDao carDao;

	@Override
	public void insertCar(Car car) {
		carDao.insertCar(car);
	}
	@Override
	public List<Car> selectCars() {
		
		return carDao.selectCars();
	}

	@Override
	public Car selectCarByCarno(int carno) {
		
		return carDao.selectCarByCarno(carno);
	}
}
