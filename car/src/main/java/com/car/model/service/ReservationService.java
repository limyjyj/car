package com.car.model.service;

import java.util.List;

import com.car.model.dto.Reservation;

public interface ReservationService {

	
	void insertReservation(Reservation reservation);

	List<Reservation> selectReservationList();
	
}
