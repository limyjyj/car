package com.car.model.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.CarDao;
import com.car.model.dto.Car;

@Service("carService")
public class CarServiceImpl implements CarService {

	@Autowired
	@Qualifier("mysqlCarDao")
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
	public List<Car> selectAllCarByCarno(int memberNo) {

		return carDao.selectAllCarByCarno(memberNo);
	}
	@Override
	public Car selectCarnoByCarindex(int carindex) {

		return carDao.selectCarnoByCarindex(carindex);
	}
	@Override
	public Car selectCarByCarno(int carno) {

		return carDao.selectCarByCarno(carno);
	}
	@Override
	public void updateCar(Car car) {
		carDao.updateCar(car);
	}
	public void deleteCar(Car car) {
		carDao.deleteCar(car);
	}
}
