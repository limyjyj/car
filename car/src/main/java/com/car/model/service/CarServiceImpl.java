package com.car.model.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.CarDao;
import com.car.model.dao.CarhistoryDao;
import com.car.model.dto.Car;
import com.car.model.dto.Carhistory;

@Service("carService")
public class CarServiceImpl implements CarService {

	@Autowired
	@Qualifier("mysqlCarDao")
	private CarDao carDao;
	
	@Autowired
	@Qualifier("mysqlCarhistoryDao")
	private CarhistoryDao carhistoryDao;

	@Override
	public void insertCar(Car car) {
		carDao.insertCar(car);
	}

	@Override
	public List<Car> selectCars(int carindex) {
		List<Car> car = carDao.selectCars(carindex);
		return car;
	}

	@Override
	public List<Car> selectAllCarByCarno(int memberNo) {

		return carDao.selectAllCarByCarno(memberNo);
	}
	@Override
	public Car selectCarnoByCarindex(int carindex) {

		return carDao.selectCarnoByCarindex(carindex);
	}
	@Override
	public Car selectCarByCarindex(int carindex) {

		return carDao.selectCarByCarindex(carindex);
	}
	@Override
	public void updateCar(Car car) {
		carDao.updateCar(car);
	}
	public void deleteCar(Car car) {
		carDao.deleteCar(car);
	}

	@Override
	public List<Car> selectCarindexByMemberno(int memberNo) {
		return carDao.selectCarindexByMemberno(memberNo);
	}

	
}
