package com.car.model.mapper;

import java.util.List;

import com.car.model.dto.Car;
import com.car.model.dto.Carhistory;

public interface CarhistoryMapper {

	void insertCarhistory(Carhistory history);
	List<Carhistory> selectAllCarhistory();
	
	Carhistory selectCarhistoryByCarno(int carno);
	Carhistory selectCarhistoryByHistoryno(int historyno);
	
	void updateCarhistory(Carhistory history);
}
