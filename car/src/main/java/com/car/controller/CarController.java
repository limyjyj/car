package com.car.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.car.model.dto.Board;
import com.car.model.dto.Car;
import com.car.model.dto.Member;
import com.car.model.dto.Reservation;
import com.car.model.service.CarService;

@Controller
@RequestMapping(value = "/car/")
public class CarController {
	
	@Autowired
	@Qualifier("carService")
	private CarService carService;

	
	// 날짜개꿀
		@InitBinder
		public void binder(WebDataBinder binder) {
			binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
		}
		
	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String registerForm(@ModelAttribute @Valid Car car) {
		

		return "car/registerform";

	}

	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String register(Car car, HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginuser");
		car.setMemberNo(member.getMemberNo());
		
		carService.insertCar(car);
		return "redirect:/car/list.action";

	}
	
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public ModelAndView carList(HttpServletRequest req, HttpSession session ) {
				
		ModelAndView mav = new ModelAndView();
		//로그인 상태가 아닌 경우 로그인 페이지로 이동
	
		String url = "list.action";
		Member member = (Member)session.getAttribute("loginuser");
		
		
		//데이터베이스에서 데이터 조회
		List<Car> cars = carService.selectAllCarByCarno(member.getMemberNo());
		
		
		mav.setViewName("car/list");
		mav.addObject("cars", cars);
	
		
		return mav;
				
	}
	
	@RequestMapping(value = "view.action", method = RequestMethod.GET)
	public ModelAndView viewList(int carindex, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();

		Member member = (Member)session.getAttribute("loginuser");
	
		List<Car> cars = null;
		
		if(carindex == 0){
			cars = carService.selectCarindexByMemberno(member.getMemberNo());
		}else{
			Car car = carService.selectCarByCarindex(carindex);
			cars = new ArrayList<>();
			cars.add(car);
		}
		
		mav.addObject("cars", cars);
		return mav;

	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.GET)
	public String editform(HttpSession session, Model model, Car car, int carindex) {
		Member member = (Member) session.getAttribute("loginuser");
		
		
		car = carService.selectCarByCarindex(carindex);
		model.addAttribute("car", car);
		System.out.println(member.getMemberId());
		return "car/editform";
	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.POST)
	public String updateCar(@ModelAttribute("Car") Car car) {

		carService.updateCar(car);
		    
		return "redirect:/car/list.action";
	   
	     	     
	}
	
	@RequestMapping(value = "delete.action", method = RequestMethod.GET)
	public String deleteCar(HttpServletRequest req, Car car) {
	
		
		// 1. 요청 데이터 읽기 (글번호)
		String carindex = req.getParameter("carindex");
		if (carindex == null || carindex.length() == 0) {
			return "redirect:/car/list.action";
		}
		carService.deleteCar(car);
		
				
		return "redirect:/car/list.action";
	}
	

	
}
