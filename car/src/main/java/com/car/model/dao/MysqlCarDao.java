package com.car.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.car.model.dto.Car;
import com.car.model.mapper.CarMapper;

@Repository("mysqlCarDao")
public class MysqlCarDao implements CarDao {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	@Qualifier("carMapper")
	private CarMapper carMapper;

	
	public void insertCar(Car car) {
		carMapper.insertCar(car);
	}
	public List<Car> selectCars() {
		
		return carMapper.selectCars();
	}

	public List<Car> selectAllCarByCarno(int memberNo) {
		
		return carMapper.selectAllCarByCarno(memberNo);
	}
	
	@Override
	public Car selectCarnoByCarindex(int carindex) {

		return carMapper.selectCarnoByCarindex(carindex);
	}
	
	public void updateCar(Car car) {
		carMapper.updateCar(car);
	}
	public void deleteCar(Car car) {
		carMapper.deleteCar(car);
	}

}
