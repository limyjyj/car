package com.car.controller;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.car.model.dto.Car;
import com.car.model.dto.Confirm;
import com.car.model.dto.Member;
import com.car.model.dto.Reservation;
import com.car.model.service.ReservationService;
import com.car.ui.ThePager3;

@Controller
@RequestMapping("/reservation")
public class ReservationController implements ApplicationContextAware, BeanNameAware {

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

		// 로그인 상태가 아닌 경우 로그인 페이지로 이동
		if (request.getSession().getAttribute("loginuser") == null) {
			mav.setViewName("redirect:/account/login.action?" + "returnuri=" + request.getRequestURI());
			return mav;
		}

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
		// List<Reservation> reservations =
		// reservationService.selectReservationList();
		// mav.setViewName("reservation/list");
		// mav.addObject("reservations", reservations);

		List<Reservation> reservations = reservationService.selectReservationList2(startRow, startRow + pageSize);
		for(Reservation r : reservations){
			r.setMember(reservationService.selectMemberByMemeberNo(r.getMemberNo()));
			
		}
		dataCount = reservationService.selectReservationCount();

		// ThePager pager = new ThePager(dataCount, currentPage, pageSize,
		// pagerSize, url);
		ThePager3 pager3 = new ThePager3(dataCount, currentPage, pageSize, pagerSize, url, queryString);

		mav.setViewName("reservation/list");
		mav.addObject("reservations", reservations);
		mav.addObject("pageno", currentPage);
		mav.addObject("pager", pager3);

		
		return mav;
	}
	
	@RequestMapping(value = "frequencylist.action", method = RequestMethod.GET)
	public ModelAndView selectReservationSearchType(HttpServletRequest request, String frequency, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		List<Reservation> frequencys = reservationService.selectReservationSearchType(frequency);
	
//	
//		if(frequency == null){
//			reservationService.selectReservationList();
//		
//			 
//		}else{
//			//List<Reservation> frequencys1 = reservationService.selectReservationSearchType(frequency);
//			
//		}
		
		mav.setViewName("reservation/list");
		mav.addObject("reservations", frequencys);
	
		
		return mav;

	}
	

	// 작성
	@RequestMapping(value = "writeform.action", method = RequestMethod.GET)
	public String getReservationWriteForm() {
		return "reservation/writeform";
	}

	@RequestMapping(value = "write.action", method = RequestMethod.POST)
	public String writeReservation(Reservation reservation, HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginuser");
		reservation.setMemberNo(member.getMemberNo());

		reservationService.insertReservation(reservation);

		return "redirect:/reservation/list.action";
	}

	// 디테일
	@RequestMapping(value = "detail.action", method = RequestMethod.GET)
	public ModelAndView showReservationByReservationNo(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		// 요청 정보에서 내용을 표시할 글번호를 읽고 변수에 저장
		// (없으면 목록으로 이동)
		String reservationNo = request.getParameter("reservationno");
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

		// reservationService.updateReservationReadCount(reservation.getReservationNo());
		// reservation.setReservationCount(reservation.getReservationCount() +
		// 1);

		String pageNo = "1";
		if (request.getParameter("pageno") != null) {
			pageNo = request.getParameter("pageno");
		}
		reservation.setMember(reservationService.selectMemberByMemeberNo(reservation.getMemberNo()));

		// 조회된 데이터를 jsp 처리할 수 있도록 request 객체에 저장
		mav.setViewName("reservation/detail");
		mav.addObject("reservation", reservation);
		mav.addObject("pageno", pageNo);

		return mav;

	}
	
	
	

    //수정
     @RequestMapping(value = "edit.action", method = RequestMethod.GET)
     public ModelAndView showBoardEditForm(HttpServletRequest request) {
    
     ModelAndView mav = new ModelAndView();
    
     String reservationNo = request.getParameter("reservationno");

     if (reservationNo == null || reservationNo.length() == 0) {
     mav.setViewName("redirect:/reservation/list.action");
     return mav;
     }
    
     Reservation reservation =
     reservationService.selectReservationByReservationNo(Integer.parseInt(reservationNo));
    
     if (reservation == null) {
     mav.setViewName("redirect:/reservation/detail.action");
     return mav;
     }
    
     String pageNo = "1";
     if (request.getParameter("pageno") != null) {
     pageNo = request.getParameter("pageno");
     }
    
     mav.addObject("reservation",reservation);
     mav.addObject("pageno", pageNo);
     mav.setViewName("reservation/editform");
     return mav;
     }
     
    //수정
     @RequestMapping(value = "update.action", method = RequestMethod.POST)
     public String updateBoard(HttpServletRequest req, Reservation reservation) {
     
     // 2. 데이터베이스에 변경된 내용 적용
     reservationService.updateReservation(reservation);
    
     // 3. 목록 페이지로 이동
     return "redirect:/reservation/detail.action" + "?reservationno=" + reservation.getReservationNo()
     + "&pageno="
     + req.getParameter("pageno");
     }
     
     
    //삭제
     @RequestMapping(value = "delete.action", method = RequestMethod.GET)
     public String deleteReservation(HttpServletRequest req, int reservationno) {
     // 1. 요청 데이터 읽기 (글번호)
    
    
     // 2. 데이터 처리 (db에서 데이터 변경)
     reservationService.deleteReservation(reservationno);
     
    
     return "redirect:/reservation/list.action";
     }
     


	// 그룹 리스트 보기
	
	@RequestMapping(value = "confirm.action", method = RequestMethod.GET)
	public String showConfirmList(HttpServletRequest request, HttpServletResponse response, Confirm confirm) {

		reservationService.insertConfirm(confirm);

		System.out.println(confirm.getReservationNo());
		// selectConfirmListByReservationNo

		// Gson gson = new Gson();
		// PrintWriter writer;
		// if (confirms != null) {
		// try {
		// writer = response.getWriter();
		//
		// String json = gson.toJson(confirms);
		// //writer.println(json);
		// writer.write(json);
		//
		// } catch (IOException e) {
		// e.printStackTrace();
		// }
		//
		// }
		return "redirect:/reservation/list.action";
	}

	// 리스트
	/*
	 * @RequestMapping(value = "confirmlist.action", method = RequestMethod.GET)
	 * public ModelAndView showConfirmList(HttpServletRequest request, int
	 * reservationNo) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * List<Member> confirmedMembersList =
	 * reservationService.selectConfirmListByReservationNo(reservationNo);
	 * mav.setViewName("reservation/confirmlist");
	 * mav.addObject("confirmedMembersList", confirmedMembersList);
	 * 
	 * 
	 * return mav; }
	 */

	
	@RequestMapping(value = "confirmlist.action", method = RequestMethod.GET)
	public String showConfirmList(Model model,HttpServletRequest request, HttpServletResponse response, int reservationNo) {

		List<Confirm> confirmedMembersList = reservationService.selectConfirmListByReservationNo(reservationNo);
		
		for (Confirm confirm : confirmedMembersList) {
		//	confirm.setMember(confirm.getMemberNo());
			System.out.println(confirm.getMemberNo());
		}
		
		
		
		System.out.println(reservationNo);
		model.addAttribute("confirms", confirmedMembersList);
		model.addAttribute("reservationNo",reservationNo );
		
		return "reservation/confirm";

	}
	// 작성
		@RequestMapping(value = "insertno.action", method = RequestMethod.GET)
		public void insertReservationNoToMember(int reservationNo) {
			reservationService.insertReservationNoToMember(reservationNo);
			
		}
		
		
		@RequestMapping(value = "confirmAjax.action", method = RequestMethod.GET)
		public String confirmAjaxPost(Member member) {
			System.out.println(member.getReservationNo());
			System.out.println(member.getMemberNo());
	
		
			reservationService.updateMemberByReservationNo(member);

			return "redirect:/reservation/list.action";
		
		
		}
		
		@RequestMapping(value = "departureSearch.action", method = RequestMethod.GET)
	    public ModelAndView departureSearch(HttpServletRequest request, String departure) {
	       
	       ModelAndView mav = new ModelAndView();
	       
	       List<Reservation> departures = reservationService.departureSearch(departure);
	    
	    
	       mav.setViewName("reservation/list");
	       mav.addObject("reservations", departures);
	    
	       
	       return mav;

	    }
		
	

}
