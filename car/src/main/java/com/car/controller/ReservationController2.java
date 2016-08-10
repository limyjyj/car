package com.car.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.car.model.dto.Reservation;
import com.car.model.service.ReservationService2;

@Controller
@RequestMapping("/reservation")
public class ReservationController2 {
	
@Autowired
@Qualifier("regervationService")
private ReservationService2 regervationService;
	
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public ModelAndView showRegervationList(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		// 로그인 상태가 아닌 경우 로그인 페이지로 이동
		if (request.getSession().getAttribute("loginuser") == null) {
			mav.setViewName("redirect:/account/login.action?" + "returnuri=" + request.getRequestURI());
			return mav;
		}
		
		List<Reservation> regervations = regervationService.selectReservationList();
		
		mav.setViewName("regervation/list");
		mav.addObject("regervations", regervations);
		
		return mav;
	}

	
}