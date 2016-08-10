package com.car.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.car.model.dto.Reservation;
import com.car.model.mapper.ReservationMapper2;

@Repository("oracleReservationDao")
public class OracleReservationDao2 implements ReservationDao2 {

	@Autowired
	@Qualifier("reservationMapper")
	private ReservationMapper2 reservationMapper;

	@Override
	public List<Reservation> selectReservationList() {
		return null;
	}


}