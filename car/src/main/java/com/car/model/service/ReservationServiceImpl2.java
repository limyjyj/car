package com.car.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.ReservationDao2;
import com.car.model.dto.Reservation;

@Service("ReservationService")
public class ReservationServiceImpl2 implements ReservationService2 {

	@Autowired
	@Qualifier("oracleReservationDao")
	private ReservationDao2 reservationDao;

	@Override
	public List<Reservation> selectReservationList() {
		return reservationDao.selectReservationList();
	}

}
