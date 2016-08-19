package com.car.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.car.model.dto.Carhistory;
import com.car.model.mapper.CarhistoryMapper;

@Repository("mysqlCarhistoryDao")
public class MysqlCarhistoryDao implements CarhistoryDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	@Qualifier("carhistoryMapper")
	private CarhistoryMapper historyMapper;

	public int insertCarhistory(Carhistory carhistory) {
		
		historyMapper.insertCarhistory(carhistory);
		return carhistory.getHistoryNo();
		
	}

	public List<Carhistory> selectAllCarhistory() {

		return historyMapper.selectAllCarhistory();
	}

	public Carhistory selectCarhistoryByCarno(int carno) {

		return historyMapper.selectCarhistoryByCarno(carno);
	}

	public Carhistory selectCarhistoryByHistoryno(int Historyno) {

		return historyMapper.selectCarhistoryByHistoryno(Historyno);
	}

	public List<Carhistory> selectCarhistoryByCarindex(int carindex) {

		return historyMapper.selectCarhistoryByCarindex(carindex);
	}

	public void updateCarhistory(Carhistory carhistory) {
		historyMapper.updateCarhistory(carhistory);
	}

	@Override
	public List<Carhistory> selectCarhistoryByMemberNo(int memberNo) {
		return historyMapper.selectCarhistoryByMemberNo(memberNo);
	}

}
