package com.car.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.car.model.dto.Board;
import com.car.model.dto.Car;
import com.car.model.dto.Member;
import com.car.model.service.CarService;

@Controller
@RequestMapping(value = "/car/")
public class CarController {
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@Autowired
	@Qualifier("carService")
	private CarService carService;

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
	public ModelAndView carList(HttpServletRequest req, HttpSession session) {
				
		ModelAndView mav = new ModelAndView();
		//로그인 상태가 아닌 경우 로그인 페이지로 이동
	
		System.out.println("test1");
		
		String url = "list.action";
		Member member = (Member)session.getAttribute("loginuser");
		
		System.out.println("test2");
		
		//데이터베이스에서 데이터 조회
		List<Car> cars = carService.selectAllCarByCarno(member.getMemberNo());
		
		for (Car car : cars) {
			System.out.println(car.getMemberNo());
		}
		
		
		mav.setViewName("car/list");
		mav.addObject("cars", cars);
	
		
		return mav;
				
	}
	

	@RequestMapping(value = "view.action", method = RequestMethod.GET)
	public ModelAndView viewList(@ModelAttribute Car car, int carno, int carindex) {
		
		ModelAndView mav = new ModelAndView();
				
		/*car = carService.selectCarByCarno(carno);
		mav.setViewName("car/list");
		mav.addObject("car", car);*/
		
		return mav;

	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.GET)
	public ModelAndView updateForm(int carindex) {
		
		ModelAndView mav = new ModelAndView();
		

		Car car = carService.selectCarnoByCarindex(carindex);
		
		if (car == null) {
			mav.setViewName("redirect:/car/list.action");
			return mav;
		}
				
		mav.addObject("car", car);
		mav.setViewName("car/editform");
		return mav;
	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.POST)
	public String update(HttpServletRequest req, Car car) {

		
		carService.updateCar(car);
		
		return "redirect:/car/list.action";

	}
	@RequestMapping(value = "delete.action", method = RequestMethod.GET)
	public String deleteCar(HttpServletRequest req) {
		
		Car car = new Car();
		String carindex = req.getParameter("carindex");
		if (carindex == null || carindex.length() == 0) {
			return "redirect:/car/list.action";
		}
		
		
		carService.deleteCar(car);
		
				
		return "redirect:/car/list.action";
	}
	

	
}
