package com.car.model.dao;

import java.util.List;

import com.car.model.dto.Carhistory;

public interface CarhistoryDao {

	void insertCarhistory(Carhistory history);
	List<Carhistory> selectAllCarhistory();
	
	Carhistory selectCarhistoryByCarno(int carno);
	Carhistory selectCarhistoryByHistoryno(int historyno);
	void updateCarhistory(Carhistory history);
}
