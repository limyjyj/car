package com.car.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.car.model.dto.Car;
import com.car.model.dto.Carhistory;
import com.car.model.dto.Member;
import com.car.model.service.CarService;
import com.car.model.service.CarhistoryService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/carhistory/")
public class CarhistoryController {
	
	@Autowired
	@Qualifier("carhistoryService")
	private CarhistoryService carhistoryService;
	@Autowired
	@Qualifier("carService")
	private CarService carService;

	
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public ModelAndView historyList(HttpServletRequest request, HttpSession session ) {
				
		ModelAndView mav = new ModelAndView();
		//로그인 상태가 아닌 경우 로그인 페이지로 이동
	
		String url = "list.action";
		Member member = (Member)session.getAttribute("loginuser");
		
	
		 
		
		//데이터베이스에서 데이터 조회
		List<Carhistory> historys = carhistoryService.selectCarByCarindex(member.getMemberNo());
		
		
		mav.setViewName("carhistory/list");
		mav.addObject("historys", historys);
	
		
		return mav;
				
	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.POST)
	public String matching(
			// 스프링 태그 라이브러리를 사용하기 위해 구성한 전달인자
			@ModelAttribute Carhistory history) {

		carhistoryService.updateCarhistory(history);
		return "redirect:/carhistory/list.action";

	}
	

	
}
