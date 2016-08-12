package com.car.model.service;

import java.util.List;

import com.car.model.dto.Car;
import com.car.model.dto.Carhistory;

public interface CarhistoryService {

	void insertCarhistory(Carhistory history);
	List<Carhistory> selectAllCarhistory();
	
	Carhistory selectCarhistoryByCarno(int carno);
	Carhistory selectCarhistoryByHistoryno(int historyno);
	List<Carhistory> selectCarByCarindex(int memberNo);
	void updateCarhistory(Carhistory history);

}
