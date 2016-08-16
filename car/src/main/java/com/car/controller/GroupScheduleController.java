package com.car.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.car.model.dto.GroupChat;
import com.car.model.dto.GroupSchedule;
import com.car.model.service.GroupChatService;
import com.car.model.service.GroupScheduleService;
import com.car.model.service.ReservationService;
import com.google.gson.Gson;


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
	
	
	@RequestMapping(value = "grouppage.action", method = RequestMethod.GET)
	public String groupPage(HttpServletRequest req, HttpServletResponse resp, Model model) {
		
		Gson gson = new Gson();
		PrintWriter writer;
		
		List<GroupChat> groupChatList = groupChatService.selectAllGroupChat();
		
		if (groupChatList != null) {
			try {
				writer = resp.getWriter();
				String json = gson.toJson(groupChatList);
				writer.println(json);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("groupchatlist", groupChatList);
				
		return "groupchat/view";
	}
	
	@RequestMapping(value = "create.action", method = RequestMethod.GET)
	public void createGet(HttpServletRequest req, HttpServletResponse resp, @Valid @ModelAttribute GroupSchedule groupSchedule) {
		
		Gson gson = new Gson();
		PrintWriter writer;
		
		if (groupSchedule != null) {
			try {
				writer = resp.getWriter();
				String json = gson.toJson(groupSchedule);
				
				groupScheduleService.insertGroupSchedule(groupSchedule);
				writer.println(json);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
}









