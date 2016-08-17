package com.car.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanNameAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.car.model.dto.Car;
import com.car.model.dto.Carhistory;
import com.car.model.dto.Member;
import com.car.model.service.CarService;
import com.car.model.service.CarhistoryService;

@Controller
@RequestMapping(value = "/carhistory/")
public class CarhistoryController implements ApplicationContextAware, BeanNameAware {

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
	@Qualifier("carhistoryService")
	private CarhistoryService carhistoryService;
	@Autowired
	@Qualifier("carService")
	private CarService carService;

	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public ModelAndView historyList(HttpServletRequest request, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		// 로그인 상태가 아닌 경우 로그인 페이지로 이동

		String url = "list.action";
		Member member = (Member) session.getAttribute("loginuser");

		// 데이터베이스에서 데이터 조회
		List<Carhistory> historys = carhistoryService.selectCarByCarindex(member.getMemberNo());

		mav.setViewName("carhistory/list");
		mav.addObject("historys", historys);

		return mav;

	}

	// 작성
	@RequestMapping(value = "writeform.action", method = RequestMethod.GET)
	public String getCarhistoryWriteForm() {
		return "outcome/writeform";
	}

	@RequestMapping(value = "write.action", method = RequestMethod.POST)
	public String writeCarhistory(HttpServletRequest req, Carhistory carhistory, Car car, HttpSession session,int carindex) {
		System.out.println("2");
		
		

		
		List<Car> cars = carService.selectCars(carindex);
		
		System.out.println("히스토리넘버 :" + carhistory.getHistoryNo() + "," + cars.get(0).getCarindex());
		System.out.println("인덱스 :" + carhistory.getCarindex() + "," + car.getCarindex() );
			
//		int size = mapwidth * mapheight;
//		MapInfo mi = new MapInfo();
//		System.out.println(maptitle);
//
//		mi.setMapHeight(mapheight);
//		mi.setMapWidth(mapwidth);
//		mi.setMapTitle(maptitle);
//		
//		carhistoryService.insertCarhistory(carhistory);
//		farmMapService.insertMapInfo(mi);
//
//		List<FarmMap> fms = new ArrayList<FarmMap>();
//		for (int i = 0; i < size; i++) {
//			FarmMap fm = new FarmMap();
//
//			fm.setMapPrice(mapprice);
//			fm.setMapIndex(i);
//			fm.setUsed(req.getParameter("used" + i));
//			fm.setMapInfoNo(mi.getMapInfoNo());
//			fms.add(fm);
//		}
//
//		for (int i = 0; i < size; i++) {
//
//			farmMapService.insertFarmMap(fms.get(i));
//		}


//	return"redirect:/farmmap/list.action";
//
//	System.out.println("3");
//
	return"redirect:/carhistory/list.action";

	}

	@RequestMapping(value = "update.action", method = RequestMethod.POST)
	public String matching(
		// 스프링 태그 라이브러리를 사용하기 위해 구성한 전달인자
		@ModelAttribute Carhistory history) {

		carhistoryService.updateCarhistory(history);
		return "redirect:/carhistory/list.action";

	}
	
}
