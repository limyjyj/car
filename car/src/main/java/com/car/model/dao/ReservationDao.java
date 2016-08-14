package com.car.model.dao;



import java.util.List;

import com.car.model.dto.Reservation;




public interface ReservationDao {

	void insertReservation(Reservation reservation);

	List<Reservation> selectReservationList();

	List<Reservation> selectReservationList2(int start, int last);

	Reservation selectReservationByReservationNo(int number);

	 int selectReservationCount();
		
	 void updateReservationReadCount(int number);
	 
	 void updateReservation(Reservation reservation);
	 
	 void deleteReservation(Reservation reservation);
	 
}