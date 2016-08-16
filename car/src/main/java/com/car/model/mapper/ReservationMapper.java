package com.car.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.car.model.dto.Reservation;



public interface ReservationMapper {
	
	void insertReservation(Reservation reservation);
	
	List<Reservation> selectReservationList();
	

	List<Reservation> selectReservationList2(int start, int last);
	
	Reservation selectReservationByReservationNo(int reservationNo);
	    
	int selectReservationCount();
		
	
	void updateReservation(Reservation reservation);
	
	void deleteReservation(int reservationNo);
}
