package com.car.model.dao;



import java.util.List;

import com.car.model.dto.Confirm;




public interface ConfirmDao {

//	void insertReservation(Reservation reservation);

	List<Confirm> selectConfirmList();

//	List<Reservation> selectReservationList2(int start, int last);
//
//
//	Reservation selectReservationByReservationNo(int number);
//
//	int selectReservationCount();
//	
//	 
//	 void updateReservation(Reservation reservation);
//	 
//	 void deleteReservation(int reservationNo);
	 
}