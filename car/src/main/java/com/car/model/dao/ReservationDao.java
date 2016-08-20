package com.car.model.dao;



import java.util.List;

import com.car.model.dto.Confirm;
import com.car.model.dto.Member;
import com.car.model.dto.Reservation;



public interface ReservationDao {

	void insertReservation(Reservation reservation);

	List<Reservation> selectReservationList();

	List<Reservation> selectReservationList2(int start, int last);


	Reservation selectReservationByReservationNo(int number);

	int selectReservationCount();
	
	 
	 void updateReservation(Reservation reservation);
	 
	 void deleteReservation(int reservationNo);
	 
	 void insertConfirm(Confirm confirm);
	 
	 List<Confirm> selectConfirmList();
	 
	 List<Confirm> selectConfirmListByReservationNo(int reservationNo);
	 
	 Member selectMemberByMemeberNo(int memberNo);
	 
	 List<Reservation> selectReservationSearchType(String frequency);
	 
	 int insertReservationNoToMember(int reservationNo);
	 
	 void updateMemberByReservationNo(Member member);
	 
	 void deleteConfirm(Confirm confirm);
	 
	 void deleteGroup(int reservationNo);
}