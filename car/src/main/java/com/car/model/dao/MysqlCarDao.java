package com.car.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.car.model.dto.Car;
import com.car.model.dto.GroupChat;
import com.car.model.mapper.CarMapper;

public class MysqlCarDao {
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

	public Car selectCarByCarno(int carno) {
		
		return carMapper.selectCarByCarno(carno);
	}

}
