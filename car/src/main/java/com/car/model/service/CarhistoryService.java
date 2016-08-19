package com.car.model.service;

import java.util.List;

import com.car.model.dto.Carhistory;

public interface CarhistoryService {

	int insertCarhistory(Carhistory carhistory);
	List<Carhistory> selectAllCarhistory();
	
	Carhistory selectCarhistoryByCarno(int carno);
	Carhistory selectCarhistoryByHistoryno(int historyno);
	List<Carhistory> selectCarByCarindex(int memberNo);
	void updateCarhistory(Carhistory carhistory);

}
