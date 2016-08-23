package com.car.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.car.model.dto.Car;
import com.car.model.dto.Member;
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
		System.out.println("1번");
	

		return "car/registerform";

	}

	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String register(@Valid @ModelAttribute Car car, HttpSession session) {
		System.out.println("2번");

		System.out.println(car.getCarno());
		Member member = (Member)session.getAttribute("loginuser");
		car.setMemberNo(member.getMemberNo());
		carService.insertCar(car);
		return "redirect:/car/list.action";

	}
	
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public ModelAndView carList(HttpServletRequest req, HttpSession session) {
				
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
		
		int total = carService.selectTotalOutcomeByCarindex(carindex);
		
		List<Car> cars = null;
		
		if(carindex == 0){
			cars = carService.selectCarindexByMemberno(member.getMemberNo());
		}else{
			System.out.println(carindex);
			Car car = carService.selectCarByCarindex(carindex);
			cars = new ArrayList<>();
			cars.add(car);
		}
		mav.addObject("cars", cars);
		mav.addObject("total", total);
		return mav;

	}
	
	@RequestMapping(value = "searchview.action", method = RequestMethod.GET)
	public ModelAndView searchViewList(Date startDate, Date endDate, int carindex) {
		
		ModelAndView mav = new ModelAndView();

		
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd"); 
		
		int count = carService.selectCountFuelByRegdate(startDate, endDate, carindex);
		int totalFuel = carService.selectTotalFuelByRegdate(startDate, endDate, carindex);
		int totalRepair = carService.selectTotalRepairByCategory(startDate, endDate, carindex);
		int totalMaintain = carService.selectTotalMaintainByCategory(startDate, endDate, carindex);
		

		mav.addObject("count", count);
		mav.addObject("totalFuel", totalFuel);
		mav.addObject("totalRepair", totalRepair);
		mav.addObject("totalMaintain", totalMaintain);
		return mav;

	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.GET)
	public ModelAndView updateForm(HttpSession session, int carindex) {
		
		ModelAndView mav = new ModelAndView();
	    
		Member member = (Member)session.getAttribute("loginuser");
		
	        
	    Car car = carService.selectCarByCarindex(carindex);
	    	    
	    
	    mav.addObject("car", car);
	    mav.setViewName("car/editform");
	    return mav;

	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.POST)
	public String update(Car car) {

		
		carService.updateCar(car);
		
		return "redirect:/car/list.action";

	}
	@RequestMapping(value = "delete.action", method = RequestMethod.GET)
	public String deleteCar(HttpServletRequest req, Car car, int carindex) {
		
		
		
		carService.deleteCar(car);
		
				
		return "redirect:/car/list.action";
	}
	

	
}
