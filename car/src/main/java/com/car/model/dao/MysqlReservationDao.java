package com.car.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.car.model.dto.Reservation;

import com.car.model.mapper.ReservationMapper;



@Repository("mysqlReservationDao")
public class MysqlReservationDao implements ReservationDao {

	@Autowired
	@Qualifier("reservationMapper")
	private ReservationMapper reservationMapper;

	@Override
	public void insertReservation(Reservation reservation) {
		
		reservationMapper.insertReservation(reservation);
		
	}

	@Override
	public List<Reservation> selectReservationList() {
		
		
		List<Reservation> reservationlist =reservationMapper.selectReservationList();
		reservationMapper.selectReservationList();
		
		return reservationlist;
	}

	

	/*@Override
	public void updateReservation(Reservation reservation) {
	
		reservationMapper.updateReservation(reservation);
		
	}

	@Override
	public void deleteReservation(int reservationNo) {
	
		reservationMapper.deleteReservation(reservationNo);
		
	}

	@Override
	public List<Reservation> selectReservationList(HashMap<String, Object> reservations) {
		
		return reservationMapper.selectReservationList(reservations);
	}

	@Override
	public Reservation selectReservationByReservationNo(int reservationNo) {
		
		return reservationMapper.selectReservationByReservationNo(reservationNo);
	}

	@Override
	public void insertMapList(MapList mapList) {
	
		reservationMapper.insertMapList(mapList);
		
	}

	@Override
	public void updateMapList(MapList mapList) {
	
		reservationMapper.updateMapList(mapList);
		
	}

	@Override
	public void deleteMapList(int mapListNo) {

		reservationMapper.deleteMapList(mapListNo);
		
	}

	@Override
	public MapList selectMapListByMapListNo(int mapListNo) {
		
		return reservationMapper.selectMapListByMapListNo(mapListNo);
	}

	@Override
	public List<Reservation> selectReservationList2(int start, int end) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("last", end);
		List<Reservation> reservationList = reservationMapper.selectReservationList2(map);
		
		
		return reservationList;
	}*/

	
}