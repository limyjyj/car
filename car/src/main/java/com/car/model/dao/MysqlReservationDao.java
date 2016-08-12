package com.car.model.dao;

import java.util.HashMap;
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

	

	@Override
	public Reservation selectReservationByReservationNo(int number) {
		return reservationMapper.selectReservationByReservationNo(number);
	}

	@Override
	public int selectReservationCount() {
		return reservationMapper.selectReservationCount();
	}

	@Override
	public void updateReservationReadCount(int number) {
		reservationMapper.updateReservationReadCount(number);
	}

	



	
}