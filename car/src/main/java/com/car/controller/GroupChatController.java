package com.car.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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

import com.car.model.dto.GroupChat;
import com.car.model.dto.GroupChatStatement;
import com.car.model.dto.GroupSchedule;
import com.car.model.dto.Member;
import com.car.model.dto.Reservation;
import com.car.model.service.GroupChatService;
import com.car.model.service.GroupScheduleService;
import com.car.model.service.ReservationService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@Controller
@RequestMapping(value = "/groupchat")
public class GroupChatController {
	
	@Autowired
	@Qualifier("groupChatService")
	private GroupChatService groupChatService;
	
	@Autowired
	@Qualifier("groupScheduleService")
	private GroupScheduleService groupScheduleService;
	
	@Autowired
	@Qualifier("reservationService")
	private ReservationService reservationService;
	
	
	// long term reservation list
	@RequestMapping(value = "longtermreservationlist.action", method = RequestMethod.GET)
	public String longtermReservationList(HttpSession session, HttpServletResponse resp, Model model) {

		Member member = (Member) session.getAttribute("loginuser");
		List<Reservation> reservationList = reservationService.selectReservationByMemberNo(member.getMemberNo());
		model.addAttribute("reservations", reservationList);

		return "groupchat/list";
	}

	
	// group chat list
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public String groupChatList(Model model) {
		
		List<GroupChat> groupChatList = groupChatService.selectAllGroupChat();		
		model.addAttribute("groupchatlist", groupChatList);				
		return "groupchat/list";
	}
	
	@RequestMapping(value = "longtermreservationchat.action", method = RequestMethod.POST)
	public String enterGroupChatPost(int reservationNo, Model model, HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginuser");
		GroupChat groupChat = null;
		
		groupChat = groupChatService.selectGroupChatByMemberId(member.getMemberId());
		int chatNo;
		
		if (groupChat == null) {
			
			groupChat.setTitle("title");
			groupChat.setReservationNo(reservationNo);			
			groupChatService.insertGroupChat(groupChat);
			
			GroupChatStatement gcs = null;
			gcs.setChatNo(groupChatService.selectGroupChatByMemberId(member.getMemberId()).getChatNo());
			gcs.setMemberNo(member.getMemberNo());
			groupChatService.insertGroupChatStatement(gcs);
		}
		
		chatNo = groupChat.getChatNo();
		model.addAttribute("chatno", chatNo);
		model.addAttribute("reservationno", reservationNo);
		
		return "groupchat/view";
		
	}
	
	
	@RequestMapping(value = "chatupdate.action", method = RequestMethod.POST)
	public void groupChatUpdate(GroupChat groupChat) {		
		
		groupChatService.updateGroupChat(groupChat);
		
	}
	
	@RequestMapping(value = "delete.action", method = RequestMethod.GET)
	public String delete(int groupChatNo) {	
		
		groupChatService.deleteGroupChat(groupChatNo);		
		return "redirect:/groupchat/list.action"; 
		
	}
	
	
	@InitBinder
	public void binder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
		
	//////////////////// schedule part //////////////////////
	
	@RequestMapping(value = "insertgroupschedule.action", method = RequestMethod.POST)
	public void insertGroupSchedulePost(GroupSchedule groupSchedule, HttpSession session, int chatNo) {
		
		Member member = (Member)session.getAttribute("loginuser");
				
		if(groupScheduleService.selectGroupScheduleByMemberId(member.getMemberId()) != null) {
			
		} else if (groupSchedule != null) {
				
			// have to modify this part
			groupSchedule.setChatNo(chatNo);			
			groupScheduleService.insertGroupSchedule(groupSchedule);
		}

	}

	@ResponseBody	
	@RequestMapping(value = "view.action", method = RequestMethod.GET)
	public String viewSchedule(int scheduleNo) throws IOException {
		
		GroupSchedule groupSchedule = groupScheduleService.selectGroupScheduleByGroupScheduleNo(scheduleNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String json = gson.toJson(groupSchedule);

		return json;

	}
	
	@RequestMapping(value = "scheduleupdate.action", method = RequestMethod.POST)
	public void updateSchedule(GroupSchedule groupSchedule) throws IOException {
		
		groupScheduleService.updateGroupSchedule(groupSchedule);
		
	}
	
}









