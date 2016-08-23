package com.car.model.service;

import java.util.List;

import com.car.model.dto.Confirm;
import com.car.model.dto.Member;
import com.car.model.dto.Reservation;


public interface ReservationService {

		
	void insertReservation(Reservation reservation);

	List<Reservation> selectReservationList();
	
	List<Reservation> selectReservationList2(int start, int last);
	
	
	Reservation selectReservationByReservationNo(int reservationNo);
	
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
	
	List<Reservation> selectReservationByMemberNo(int memberNo);
	

	List<Reservation> departureSearch(String departure, String frequency);
	
	List<Member> selectReservationUserListByReservationNo(int reservationNo);


}