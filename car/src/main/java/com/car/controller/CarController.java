package com.car.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.car.model.dto.Car;
import com.car.model.service.CarService;

@Controller
@RequestMapping(value = "/car/")
public class CarController {
	
	@Autowired
	@Qualifier("carService")
	private CarService carService;

	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String registerForm(
			@ModelAttribute Car car) {
		return "car/registerform";

	}

	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String registerForm(
			@ModelAttribute Car car, HttpSession session) {

		carService.insertCar(car);

		return "redirect:/car/list.action";

	}
	
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public String carList(
			// 스프링 태그 라이브러리를 사용하기 위해 구성한 전달인자
			@ModelAttribute Car car, Model model) {
		
		List<Car> cars = carService.selectCars();
		for(Car r : cars){
			r.setCar(carService.selectCarByCarno(r.getCarno()));
			
		}
			
		
		
		model.addAttribute("cars", cars);
		
		return "car/list";

	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.POST)
	public String matching(
			// 스프링 태그 라이브러리를 사용하기 위해 구성한 전달인자
			@ModelAttribute Car car) {

		carService.updateCar(car);
		return "redirect:/car/list.action";

	}
	

	
}
