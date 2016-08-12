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
import com.car.model.dto.Carhistory;
import com.car.model.service.CarService;
import com.car.model.service.CarhistoryService;

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
	public String carhistoryList(
			// 스프링 태그 라이브러리를 사용하기 위해 구성한 전달인자
			@ModelAttribute Carhistory history, Model model) {
		
		List<Carhistory> historys = carhistoryService.selectAllCarhistory();
		for(Carhistory h : historys){
			//h.setCarhistory(carhistoryService.selectCarhistoryByHistoryno(h.getHistoryno()));
		}
		model.addAttribute("carhistorys", historys);
		
		return "carhistory/list";

	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.POST)
	public String matching(
			// 스프링 태그 라이브러리를 사용하기 위해 구성한 전달인자
			@ModelAttribute Carhistory history) {

		carhistoryService.updateCarhistory(history);
		return "redirect:/carhistory/list.action";

	}
	

	
}
