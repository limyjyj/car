package com.car.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.ReservationDao;
import com.car.model.dto.Reservation;



@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	@Qualifier("mysqlReservationDao")
	private ReservationDao reservationDao;

	@Override
	public void insertReservation(Reservation reservation) {
		
		
	}

	
<<<<<<< HEAD
	@Override
	public List<Reservation> selectReservationList() {
		List<Reservation> rs = reservationDao.selectReservationList();
		return rs;
	}




=======
	
>>>>>>> branch 'master' of https://github.com/limyjyj/car.git
}
