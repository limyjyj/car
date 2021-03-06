package com.car.model.dao;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.car.model.dto.Confirm;
import com.car.model.dto.GroupChat;
import com.car.model.dto.GroupChatStatement;
import com.car.model.dto.Member;
import com.car.model.dto.Reservation;
import com.car.model.mapper.ReservationMapper;




@Repository("mysqlReservationDao")
public class MysqlReservationDao implements ReservationDao {

   @Autowired
   @Qualifier("reservationMapper")
   private ReservationMapper reservationMapper;

   @Override
   public int insertReservation(Reservation reservation) {
	   reservationMapper.insertReservation(reservation);
		return reservation.getReservationNo();
	
   }

   @Override
   public List<Reservation> selectReservationList() {
      
      
      List<Reservation> reservationlist =reservationMapper.selectReservationList();
      reservationMapper.selectReservationList();
      
      return reservationlist;
   }
   
   @Override
   public List<Reservation> selectReservationList2(int start, int last) {

      HashMap<String, Object> map = new HashMap<>();
      map.put("start", start);
      map.put("last", last);
      List<Reservation> reservationlist = reservationMapper.selectReservationList();

      return reservationlist;
   }


   public int selectReservationCount() {
      int count = reservationMapper.selectReservationCount();
      return count;
   }
   

   @Override
   public Reservation selectReservationByReservationNo(int number) {
      return reservationMapper.selectReservationByReservationNo(number);
   }

   
   @Override
   public void updateReservation(Reservation reservation) {
      reservationMapper.updateReservation(reservation);
      
   }

   @Override
   public void deleteReservation(Reservation reservation) {
      reservationMapper.deleteReservation(reservation);
      
   }

   @Override
   public void insertConfirm(Confirm confirm) {
      reservationMapper.insertConfirm(confirm);
      
   }

   @Override
   public List<Confirm> selectConfirmList() {

      List<Confirm> confirmlist =reservationMapper.selectConfirmList();
      reservationMapper.selectConfirmList();
      
      return confirmlist;
   }

   @Override
   public List<Confirm> selectConfirmListByReservationNo(int reservationNo) {
      return reservationMapper.selectConfirmListByReservationNo(reservationNo);
      
   }

   @Override
   public Member selectMemberByMemeberNo(int memberNo) {
      return reservationMapper.selectMemberByMemeberNo(memberNo);
   }

   @Override
   public List<Reservation> selectReservationSearchType(String frequency) {
      
      return reservationMapper.selectReservationSearchType(frequency);
   }

   @Override
   public int insertReservationNoToMember(int reservationNo) {
      return reservationMapper.insertReservationNoToMember(reservationNo);
   }

   @Override
   public void updateConfirm(Hashtable<String, Integer> params) {
      reservationMapper.updateConfirm(params);
      
   }

   @Override
   public void deleteConfirm(Confirm confirm) {
      reservationMapper.deleteConfirm(confirm);
      
   }

   @Override
   public void deleteGroup(int reservationNo) {
      reservationMapper.deleteGroup(reservationNo);
      
   }
   
   @Override
   public List<Reservation> selectReservationByMemberNo(int memberNo) {
      return reservationMapper.selectReservationByMemberNo(memberNo);
   }
   
   @Override
   public List<Reservation> departureSearch(String departure, String frequency) {
      
      HashMap<String, Object> map = new HashMap<>();
      
      map.put("departure", departure);
      map.put("frequency", frequency);
      
   List<Reservation> departures = reservationMapper.departureSearch(map);
   return departures;
   
   }

@Override
public List<Member> selectReservationUserListByReservationNo(int reservationNo) {
	return reservationMapper.selectReservationUserListByReservationNo(reservationNo);
}



   



   
}