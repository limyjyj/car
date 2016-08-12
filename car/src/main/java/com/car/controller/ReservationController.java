package com.car.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanNameAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.car.model.dto.Member;
import com.car.model.dto.Reservation;
import com.car.model.service.ReservationService;
import com.car.ui.ThePager3;
import com.car.controller.ReservationController;


@Controller
@RequestMapping("/reservation")
public class ReservationController implements ApplicationContextAware, BeanNameAware{

	private ApplicationContext context;
	private String beanName;
	
	@Override
	public void setBeanName(String arg0) {
		this.beanName = arg0;
	}

	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		this.context = arg0;
	}
	
	
	@Autowired
	@Qualifier("reservationService")
	private ReservationService reservationService;

	// 리스트
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public ModelAndView showReservationList(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int currentPage = 1;
		int pageSize = 10;
		int dataCount = 0;
		int pagerSize = 5;
		String url = "list.action";

		String queryString = request.getQueryString();

		String page = request.getParameter("pageno");
		if (page != null && page.length() > 0) {
			currentPage = Integer.parseInt(page);
		}
		int startRow = (currentPage - 1) * pageSize + 1;
		
		// 데이터베이스에서 데이터 조회
					List<Reservation> reservations = reservationService.selectReservationList();
					
					

					for( Reservation sb : reservations)
					{
						System.out.println(sb.getArrival() +" " + sb.getDeparture());
					}
					mav.setViewName("reservation/list");
					mav.addObject("reservations", reservations);
				

//		ThePager pager = new ThePager(dataCount, currentPage, pageSize, pagerSize, url);
		ThePager3 pager3 = new ThePager3(dataCount, currentPage, pageSize, pagerSize, url, queryString);		
		
		mav.setViewName("reservation/list");
	//	mav.addObject("reservations", reservations);
		mav.addObject("pageno", currentPage);
		mav.addObject("pager", pager3);
			
		return mav;
	}
	

	//작성
		@RequestMapping(value = "writeform.action", method = RequestMethod.GET)
		public String getReservationWriteForm() {
			return "reservation/writeform";
		}

		@RequestMapping(value = "write.action", method = RequestMethod.POST)
		public String writeReservation( Reservation reservation, HttpSession session) {
			System.out.println("ddddd");
			Member member = (Member)session.getAttribute("loginuser");
			reservation.setMemberNo(member.getMemberNo());
			
			reservationService.insertReservation(reservation);
			
			return "redirect:/reservation/list.action";
		}


		//디테일
		@RequestMapping(value = "detail.action", method = RequestMethod.GET)
		public ModelAndView showReservationByReservationNo(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();

			// 요청 정보에서 내용을 표시할 글번호를 읽고 변수에 저장
			// (없으면 목록으로 이동)	
			String reservationNo = request.getParameter("reservationo");
			if (reservationNo == null || reservationNo.length() == 0) {
				mav.setViewName("redirect:/reservation/list.action");
				return mav;
			}
			int no = Integer.parseInt(reservationNo);
			// 데이터베이스에서 데이터 조회
			Reservation reservation = reservationService.selectReservationByReservationNo(no);
			
			
			
			// 조회 실패하면 목록으로 이동
			if (reservation == null) {
				mav.setViewName("redirect:/reservation/list.action");
				return mav;
			}

			reservationService.updateReservationReadCount(reservation.getReservationNo());
			reservation.setReservationCount(reservation.getReservationCount() + 1);

			String pageNo = "1";
			if (request.getParameter("pageno") != null) {
				pageNo = request.getParameter("pageno");
			}
			
			// 조회된 데이터를 jsp 처리할 수 있도록 request 객체에 저장
			mav.setViewName("reservation/detail");
			mav.addObject("reservation", reservation);
			mav.addObject("pageno", pageNo);

			return mav;

		}

	
}
