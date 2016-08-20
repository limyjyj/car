package com.car.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.CarhistoryDao;
import com.car.model.dto.Carhistory;

@Service("carhistoryService")
public class CarhistoryServiceImpl implements CarhistoryService {

	@Autowired
	@Qualifier("mysqlCarhistoryDao")
	private CarhistoryDao carhistoryDao;

	@Override
	public int insertCarhistory(Carhistory carhistory) {
		return carhistoryDao.insertCarhistory(carhistory);
	} 

	@Override
	public List<Carhistory> selectAllCarhistory() {

		return carhistoryDao.selectAllCarhistory();
	}

	@Override
	public Carhistory selectCarhistoryByCarno(int carno) {

		return carhistoryDao.selectCarhistoryByCarno(carno);
	}

	
	
	@Override
	public void updateCarhistory(Carhistory carhistory) {
		carhistoryDao.updateCarhistory(carhistory);
	}

	@Override
	public Carhistory selectCarhistoryByHistoryno(int historyno) {
		
		return carhistoryDao.selectCarhistoryByHistoryno(historyno);
	}



	@Override
	public List<Carhistory> selectCarhistoryByCarindex(int carindex) {
		
		return carhistoryDao.selectCarhistoryByCarindex(carindex);
	}

	@Override
	public List<Carhistory> selectCarhistoryByMemberNo(int memberNo) {
		return carhistoryDao.selectCarhistoryByMemberNo(memberNo);
	}


}
