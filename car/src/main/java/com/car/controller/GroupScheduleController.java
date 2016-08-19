package com.car.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.car.model.dto.GroupChat;
import com.car.model.dto.GroupSchedule;
import com.car.model.dto.Member;
import com.car.model.dto.Reservation;
import com.car.model.service.GroupChatService;
import com.car.model.service.GroupScheduleService;
import com.car.model.service.ReservationService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/groupschedule/")
public class GroupScheduleController {

	@Autowired
	@Qualifier("groupChatService")
	private GroupChatService groupChatService;

	@Autowired
	@Qualifier("groupScheduleService")
	private GroupScheduleService groupScheduleService;

	@Autowired
	@Qualifier("reservationService")
	private ReservationService reservationService;

	@InitBinder
	public void binder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	
	@RequestMapping(value = "longtermreservationlist.action", method = RequestMethod.GET)
	public String longtermReservationList(HttpSession session, HttpServletResponse resp, Model model) {

		Member member = (Member) session.getAttribute("loginuser");
		
		Gson gson = new Gson();
		PrintWriter writer;

		List<Reservation> reservationList = reservationService.selectReservationByMemberNo(member.getMemberNo());

		if (reservationList != null) {
			try {
				writer = resp.getWriter();
				String json = gson.toJson(reservationList);
				writer.println(json);

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		model.addAttribute("reservations", reservationList);

		return "groupchat/list";
	}

	
	@RequestMapping(value = "longtermreservationchat.action", method = RequestMethod.GET)
	public String longtermReservationChat(int reservationNo, Model model) {
		
		model.addAttribute("reservationno", reservationNo);
		
		return "groupchat/view";
	}

	
	@RequestMapping(value = "insert.action", method = RequestMethod.POST)
	public String insertGet(HttpServletRequest req, HttpServletResponse resp,
			@Valid @ModelAttribute GroupSchedule groupSchedule, HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginuser");
		groupScheduleService.selectGroupScheduleByMemberId(member.getMemberId());
		
		if(groupScheduleService.selectGroupScheduleByMemberId(member.getMemberId()) == null) 
			return "";
		
		Gson gson = new Gson();
		PrintWriter writer;

		if (groupSchedule != null) {
			try {
				writer = resp.getWriter();

				String json = gson.toJson(groupSchedule);
				
				groupSchedule.setChatNo(1);
				
				groupScheduleService.insertGroupSchedule(groupSchedule);
				writer.println(json);

			} catch (IOException e) {
				e.printStackTrace();
			}

		}

		return "success";

	}

	@ResponseBody
	@RequestMapping(value = "view.action", method = RequestMethod.GET)
	public String viewSchedule(int scheduleNo) throws IOException {
		
		GroupSchedule groupSchedule = groupScheduleService.selectGroupScheduleByGroupScheduleNo(scheduleNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String json = gson.toJson(groupSchedule);

		return json;

	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.POST)
	public void updateSchedule(GroupSchedule groupSchedule) throws IOException {
		
		groupScheduleService.updateGroupSchedule(groupSchedule);
		
	}
	
	
	/*@RequestMapping(value = "chat.action", method = RequestMethod.GET)
	public String chat(GroupChat groupChat) throws IOException {
		
		//groupChatService.insertGroupChat(groupChat);
		
		return "redirect:../aaa";
		
	}*/
}
