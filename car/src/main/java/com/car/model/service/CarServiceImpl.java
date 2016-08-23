package com.car.model.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.CarDao;
import com.car.model.dao.CarhistoryDao;
import com.car.model.dto.Car;

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
	
	@Override
	public int selectTotalOutcomeByCarindex(int carindex){
		return carDao.selectTotalOutcomeByCarindex(carindex);
	}
	@Override
	public int selectCountFuelByRegdate(Date startDate, Date endDate, int carindex){
		return carDao.selectCountFuelByRegdate(startDate, endDate, carindex);
	}
	@Override
	public int selectTotalRepairByCategory(Date startDate, Date endDate, int carindex){
		return carDao.selectTotalRepairByCategory(startDate, endDate, carindex);
	}
	@Override
	public int selectTotalMaintainByCategory(Date startDate, Date endDate, int carindex){
		return carDao.selectTotalMaintainByCategory(startDate, endDate, carindex);
	}
	
}
