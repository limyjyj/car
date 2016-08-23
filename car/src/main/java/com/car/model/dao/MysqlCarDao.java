package com.car.model.dao;

import java.util.Date;
import java.util.HashMap;
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
	public List<Car> selectCars(int carindex) {
		List<Car> car = carMapper.selectCars(carindex);
		return car;
	}

	public List<Car> selectAllCarByCarno(int memberNo) {
		
		return carMapper.selectAllCarByCarno(memberNo);
	}
	
	
	public Car selectCarnoByCarindex(int carindex) {

		return carMapper.selectCarnoByCarindex(carindex);
	}
	public Car selectCarByCarindex(int carindex) {

		return carMapper.selectCarByCarindex(carindex);
	}
	
	
	public void updateCar(Car car) {
		carMapper.updateCar(car);
	}
	public void deleteCar(Car car) {
		carMapper.deleteCar(car);
	}
	
	public List<Car> selectCarindexByMemberno(int memberNo) {
		return carMapper.selectCarindexByMemberno(memberNo);
	}
	@Override
	public int selectTotalOutcomeByCarindex(int carindex){
		return carMapper.selectTotalOutcomeByCarindex(carindex);
	}
	@Override
	public int selectCountFuelByRegdate(Date startDate, Date endDate, int carindex){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		param.put("carindex", carindex);
		return carMapper.selectCountFuelByRegdate(param);
	}
	@Override
	public int selectTotalFuelByRegdate(Date startDate, Date endDate, int carindex){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		param.put("carindex", carindex);
		return carMapper.selectTotalFuelByRegdate(param);
	}
	@Override
	public int selectTotalRepairByCategory(Date startDate, Date endDate, int carindex){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		param.put("carindex", carindex);
		return carMapper.selectTotalRepairByCategory(param);
	}
	@Override
	public int selectTotalMaintainByCategory(Date startDate, Date endDate, int carindex){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		param.put("carindex", carindex);
		return carMapper.selectTotalMaintainByCategory(param);
	}
	

}
