package com.car.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.car.model.dto.Car;
import com.car.model.dto.Carhistory;
import com.car.model.dto.Fuel;
import com.car.model.dto.Member;
import com.car.model.dto.Outcome;
import com.car.model.dto.Reservation;
import com.car.model.service.CarService;
import com.car.model.service.CarhistoryService;
import com.car.model.service.FuelService;
import com.car.model.service.OutcomeService;
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
	@Autowired
	@Qualifier("outcomeService")
	private OutcomeService outcomeService;
	@Autowired
	@Qualifier("fuelService")
	private FuelService fuelService;

	// 날짜개꿀
	@InitBinder
	public void binder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public ModelAndView historyList(HttpServletRequest request, HttpSession session) {
			
		ModelAndView mav = new ModelAndView();
		// 로그인 상태가 아닌 경우 로그인 페이지로 이동

		Member member = (Member)session.getAttribute("loginuser");
				
		//데이터베이스에서 데이터 조회
		List<Car> cars = carService.selectAllCarByCarno(member.getMemberNo());
		
		for (Car car : cars) {
			System.out.println(car.getMemberNo());
		}
		List<Outcome> outcomes = outcomeService.selectOutcomeByMemberNo(member.getMemberNo());
		List<Fuel> fuels = fuelService.selectFuelByMemberNo(member.getMemberNo());
			
		mav.setViewName("carhistory/list");
		mav.addObject("cars", cars);
		mav.addObject("outcomes", outcomes);
		mav.addObject("fuels", fuels);
		System.out.println("마지막");
		
		return mav;
	
	}
	@ResponseBody
	@RequestMapping(value = "searchlist.action", method = RequestMethod.GET)
	   public ModelAndView selectCarHistorySearchType(HttpServletRequest request, String category, HttpSession session) {
		  System.out.println("1번");
	      ModelAndView mav = new ModelAndView();

	      Member member = (Member)session.getAttribute("loginuser");
			
			//데이터베이스에서 데이터 조회
			List<Car> cars = carService.selectAllCarByCarno(member.getMemberNo());
			
			for (Car car : cars) {
				System.out.println(car.getMemberNo());
			}

	      if (category.equals("전체")) {
	    	List<Outcome> outcomes = outcomeService.selectOutcomeByMemberNo(member.getMemberNo());
	  		List<Fuel> fuels = fuelService.selectFuelByMemberNo(member.getMemberNo());
	         mav.addObject("outcomes", outcomes);
	         mav.addObject("fuels", fuels);

	      } else {
	    	List<Outcome> outcomes = outcomeService.selectOutcomeSearchType(category);
	    	List<Fuel> fuels = fuelService.selectFuelSearchType(category);
	    	mav.addObject("outcomes", outcomes);
	    	mav.addObject("fuels", fuels);
	 
	      }

	      mav.setViewName("carhistory/searchlist");

	      return mav;

	   }

	@RequestMapping(value = "view.action", method = RequestMethod.GET)
	public ModelAndView viewList(int carindex, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();

		Member member = (Member)session.getAttribute("loginuser");
	
		List<Outcome> outcomes;
		List<Fuel> fuels;
		
		if(carindex == 0){
			outcomes = outcomeService.selectOutcomeByMemberNo(member.getMemberNo());
			fuels = fuelService.selectFuelByMemberNo(member.getMemberNo());
			
		}else{
			outcomes = outcomeService.selectOutcomeByCarindex(carindex);
//			outcomes = new ArrayList<>();
//			outcomes.add(outcome);
			
			fuels = fuelService.selectFuelByCarindex(carindex);
//			fuels = new ArrayList<>();
//			fuels.add(fuel);
		}
		
		mav.addObject("outcomes", outcomes);
		mav.addObject("fuels", fuels);
	    mav.setViewName("carhistory/view");

		return mav;

	}

	
	// Outcome
	@RequestMapping(value = "outcomewriteform.action", method = RequestMethod.GET)
	public String getOutcomeWriteForm(Model model) {

		return "outcome/writeform";
	}

	@RequestMapping(value = "outcomewrite.action", method = RequestMethod.POST)
	public String writeOutcome(HttpServletRequest req, Carhistory carhistory, Outcome outcome, String category, HttpSession session,
			int carindex) {
				
		int historyno = carhistoryService.insertCarhistory(carhistory);
		
		outcome.setHistoryNo(historyno);
		
		outcomeService.insertOutcome(outcome);

		return "redirect:/carhistory/list.action";

	}
	
	@ResponseBody
	@RequestMapping(value = "outcomeview.action", method = RequestMethod.GET)
	public String outcomeViewList(int carindex, int historyNo, HttpSession session) {
		
	
		Outcome outcome = outcomeService.selectOutcomeByHistoryNo(historyNo);		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		String json = null;
		
	
			json = gson.toJson(outcome);
			return json;
			
	}
	
	@ResponseBody
	@RequestMapping(value = "outcomeupdate.action", method = RequestMethod.POST)
	public String outcomeUpdate(Outcome outcome) {		
		
		
		outcomeService.updateOutcome(outcome);
		
		return "";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "outcomedeleted.action", method = RequestMethod.POST)
	public String outcomeDeleted(Outcome outcome) {		
		
		System.out.println(outcome.getHistoryNo());
		
		outcomeService.deletedOutcome(outcome);
		
		return "";
		
	}

	
	

	// Fuel
	@RequestMapping(value = "fuelwriteform.action", method = RequestMethod.GET)
	public String getFuelWriteForm(Model model) {
		return "fuel/writeform";
	}

	@RequestMapping(value = "fuelwrite.action", method = RequestMethod.POST)
	public String writeFuel(HttpServletRequest req, Carhistory carhistory, Fuel fuel, String category, HttpSession session,
			int carindex) {
		
		int historyno = carhistoryService.insertCarhistory(carhistory);
		
		fuel.setHistoryNo(historyno);
		
//		int perliter = fuel.getPerLiter();
//		int liter = fuel.getLiter();
//		System.out.println(perliter*liter);
//		
//		fuel.setPayment(liter*perliter);
		
		fuelService.insertFuel(fuel);

		return "redirect:/carhistory/list.action";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "fuelview.action", method = RequestMethod.GET)
	public String fuelViewList(int carindex, int historyNo, HttpSession session) {
		
		Fuel fuel = fuelService.selectFuelByHistoryNo(historyNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		String json = null;
		
			json = gson.toJson(fuel);
			return json;
			
	}
	
	@ResponseBody
	@RequestMapping(value = "fuelupdate.action", method = RequestMethod.POST)
	public String fuelUpdate(Fuel fuel) {		
		
		int perliter = fuel.getPerLiter();
		int liter = fuel.getLiter();
		
		fuel.setPayment(perliter*liter);
		
		fuelService.updateFuel(fuel);
		
		return "";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "fueldeleted.action", method = RequestMethod.POST)
	public String fuelDeleted(Fuel fuel) {		
		
		System.out.println(fuel.getHistoryNo());
		
		fuelService.deletedFuel(fuel);
		
		return "";
		
	}

}
