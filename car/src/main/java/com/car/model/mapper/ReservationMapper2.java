package com.car.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.car.model.dto.Reservation;

public interface ReservationMapper2 {
	
	List<Reservation> selectReservationList(HashMap<String, Object> map);

}
