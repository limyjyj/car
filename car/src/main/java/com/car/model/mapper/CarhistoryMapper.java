package com.car.model.mapper;

import java.util.List;import com.car.model.dto.Car;
import com.car.model.dto.Carhistory;

public interface CarhistoryMapper {

	int insertCarhistory(Carhistory carhistory);
	List<Carhistory> selectAllCarhistory();
	
	Carhistory selectCarhistoryByCarno(int carno);
	Carhistory selectCarhistoryByHistoryno(int historyno);
	
	List<Carhistory> selectCarhistoryByCarindex(int carindex);
	
	List<Carhistory> selectCarhistoryByMemberNo(int memberNo);
	
	void updateCarhistory(Carhistory carhistory);
	
	List<Carhistory> selectCarhistorySearchType(String category);
}
