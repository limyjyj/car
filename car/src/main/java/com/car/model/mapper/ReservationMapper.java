package com.car.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.car.model.dto.Reservation;



public interface ReservationMapper {
	
	void insertReservation(Reservation reservation);
	List<Reservation> selectReservationList();

	List<Reservation> selectReservationList(HashMap<String, Object> map);
	
	Reservation selectReservationByReservationNo(int reservationNo);
	
	int selectReservationCount();
		
	void updateReservationReadCount(int number);

	void updateReservation(Reservation reservation);
	
	void deleteReservation(Reservation reservation);
}
