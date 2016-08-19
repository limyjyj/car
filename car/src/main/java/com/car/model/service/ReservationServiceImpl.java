package com.car.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.ReservationDao;
import com.car.model.dto.Confirm;
import com.car.model.dto.Member;
import com.car.model.dto.Reservation;





@Service("reservationService")

public class ReservationServiceImpl implements ReservationService {

	@Autowired
	@Qualifier("mysqlReservationDao")
	private ReservationDao reservationDao;
	

	

	@Override
	public void insertReservation(Reservation reservation) {


		reservationDao.insertReservation(reservation);

	}
	
	@Override
	public List<Reservation> selectReservationList() {
		return reservationDao.selectReservationList();
	}
	

	@Override
	public List<Reservation> selectReservationList2(int start, int last) {
		return reservationDao.selectReservationList2(start, last);
	}

	@Override
	public Reservation selectReservationByReservationNo(int reservationNo) {
		
		return reservationDao.selectReservationByReservationNo(reservationNo);

	  }
	


	@Override
	public void updateReservation(Reservation reservation) {
		reservationDao.updateReservation(reservation);
		
	}

	@Override
	public void deleteReservation(int reservationNo) {
		reservationDao.deleteReservation(reservationNo);
		
	 }

	@Override
	public int selectReservationCount() {
		
		 return reservationDao.selectReservationCount();
	}

	@Override
	public void insertConfirm(Confirm confirm) {
		reservationDao.insertConfirm(confirm);
		
	}

	@Override
	public List<Confirm> selectConfirmList() {
		return reservationDao.selectConfirmList();
	}

	@Override
	public List<Confirm> selectConfirmListByReservationNo(int reservationNo) {
		return reservationDao.selectConfirmListByReservationNo(reservationNo);
		
	}

	@Override
	public Member selectMemberByMemeberNo(int memberNo) {
		
		return reservationDao.selectMemberByMemeberNo(memberNo);
	}

	@Override
	public List<Reservation> selectReservationSearchType(String frequency) {
		return reservationDao.selectReservationSearchType(frequency);
	}

	@Override
	public int insertReservationNoToMember(int reservationNo) {
		return reservationDao.insertReservationNoToMember(reservationNo);
	}

	@Override
	public void updateMemberByReservationNo(Member member) {
		reservationDao.updateMemberByReservationNo(member);
		
	}

	@Override
	public void deleteConfirm(Confirm confirm) {
		reservationDao.deleteConfirm(confirm);
		
	}

	



	}




