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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.car.model.dto.Reservation;
import com.car.model.service.ReservationService;
import com.car.ui.ThePager3;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	@Qualifier("reservationService")
	private ReservationService reservationService;

	// 리스트
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public ModelAndView showBoardList(HttpServletRequest request) {

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
		List<Reservation> reservations = reservationService.selectReservationList2(startRow, startRow + pageSize);
		dataCount = reservationService.selectReservationCount();

//		ThePager pager = new ThePager(dataCount, currentPage, pageSize, pagerSize, url);
		ThePager3 pager3 = new ThePager3(dataCount, currentPage, pageSize, pagerSize, url, queryString);		
		
		mav.setViewName("reservation/list");
		mav.addObject("reservations", reservations);
		mav.addObject("pageno", currentPage);
		mav.addObject("pager", pager3);
			
		return mav;
	}
	
//	
//	@RequestMapping(value = "detail.action", method = RequestMethod.GET)
//	public ModelAndView showBoardByBoardNo(HttpServletRequest request) {
//
//		ModelAndView mav = new ModelAndView();
//
//		// 요청 정보에서 내용을 표시할 글번호를 읽고 변수에 저장
//		// (없으면 목록으로 이동)
//		String productNo = request.getParameter("productno");
//		if (productNo == null || productNo.length() == 0) {
//			System.out.println("1");
//			mav.setViewName("redirect:/product/shopping.action");
//			return mav;
//		}
//		int no = Integer.parseInt(productNo);
//
//		// 데이터베이스에서 데이터 조회
//		Product product = productService.selectProductByProductNo(no);
//
//		// 조회 실패하면 목록으로 이동
//		if (product == null) {
//			System.out.println("2");
//			mav.setViewName("redirect:/product/shopping.action");
//			return mav;
//		}
//
//		// productService.updateProductReadCount(product.getProductNo());
//		// product.setProductCount(product.getProductCount() + 1);
//
//		String pageNo = "1";
//		if (request.getParameter("pageno") != null) {
//			pageNo = request.getParameter("pageno");
//		}
//
//		List<ProductUploadFile> files = productService.selectProductuploadfileByProductNo(product.getProductNo());
//		product.setProductUploadFiles(files);
//
//		for (ProductUploadFile f : files) {
//			System.out.println("filename" + f.getProductfileName());
//		}
//
//		// 조회된 데이터를 jsp 처리할 수 있도록 request 객체에 저장
//		mav.setViewName("shopping/detail");
//		mav.addObject("product", product);
//		mav.addObject("pageno", pageNo);
//
//		return mav;
//
//	}
	
	
}
