package com.car.model.mapper;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;

import com.car.model.dto.Confirm;
import com.car.model.dto.GroupChat;
import com.car.model.dto.GroupChatStatement;
import com.car.model.dto.Member;
import com.car.model.dto.Reservation;

public interface ReservationMapper {
	
	List<GroupChat> selectConfirmChatInfo(int reservationNo);

	int insertReservation(Reservation reservation);

	List<Reservation> selectReservationList();

	List<Reservation> selectReservationList2(int start, int last);

	Reservation selectReservationByReservationNo(int reservationNo);

	int selectReservationCount();

	void updateReservation(Reservation reservation);

	void deleteReservation(Reservation reservation);

	void insertConfirm(Confirm confirm);

	List<Confirm> selectConfirmList();

	List<Confirm> selectConfirmListByReservationNo(int reservationNo);

	Member selectMemberByMemeberNo(int memberNo);

	List<Reservation> selectReservationSearchType(String frequency);

	int insertReservationNoToMember(int reservationNo);

	void updateConfirm(Hashtable<String, Integer> params);

	List<Reservation> selectReservationByMemberNo(int memberNo);

	 void deleteConfirm(Confirm confirm);
	 
	 void deleteGroup(int reservationNo);


	List<Reservation> departureSearch(HashMap<String, Object> map);
	
	List<Member> selectReservationUserListByReservationNo(int reservationNo);
	
	

}

