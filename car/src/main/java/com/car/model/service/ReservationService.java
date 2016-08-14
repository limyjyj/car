package com.car.model.service;

import java.util.List;

import com.car.model.dto.Reservation;


public interface ReservationService {

		
	void insertReservation(Reservation reservation);

	List<Reservation> selectReservationList();
	
	List<Reservation> selectReservationList2(int start, int last);
	
	Reservation selectReservationByReservationNo(int reservationNo);
	
    int selectReservationCount();
	
	void updateReservationReadCount(int number);
	
	void updateReservation(Reservation reservation);
	
	void deleteReservation(Reservation reservation);
}
