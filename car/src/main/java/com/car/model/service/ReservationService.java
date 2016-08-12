package com.car.model.service;

import java.util.List;

import com.car.model.dto.Reservation;


public interface ReservationService {

		
	void insertReservation(Reservation reservation);

	List<Reservation> selectReservationList();
	
	
	Reservation selectReservationByReservationNo(int reservationNo);
	
    int selectReservationCount();
	
	void updateReservationReadCount(int number);
	
	
}
