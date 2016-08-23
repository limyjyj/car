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
	
	
	@InitBinder
	public void binder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	// long term reservation list
	@RequestMapping(value = "longtermreservationlist.action", method = RequestMethod.GET)
	public String longtermReservationList(HttpSession session, HttpServletResponse resp, Model model) {

		Member member = (Member) session.getAttribute("loginuser");
		List<Reservation> reservationList = reservationService.selectReservationByMemberNo(member.getMemberNo());
		for (Reservation r : reservationList) {
			r.setMember(reservationService.selectMemberByMemeberNo(r.getMemberNo()));

		}
		model.addAttribute("reservations", reservationList);
		model.addAttribute("loginuser", member);

		return "groupchat/list";
	}

	
	// group chat list
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public String groupChatList(Model model) {
		
		List<GroupChat> groupChatList = groupChatService.selectAllGroupChat();		
		model.addAttribute("groupchatlist", groupChatList);				
		return "groupchat/list";
	}
	
	// reservation user list
	@ResponseBody
	@RequestMapping(value = "reservationuserlist.action", method = RequestMethod.GET)
	public String getReservationUserList(int reservationNo, Model model) {
		
		Gson gson = new Gson();
		
		List<Member> reservationUserList = reservationService.selectReservationUserListByReservationNo(reservationNo);
		
		String json = null;
		
		if (reservationUserList == null) {
			int i = 10/0;
			System.out.println(i);
			return json;
			
		} else {
			json = gson.toJson(reservationUserList);
			return json;
		}
		
	}
	
	
	@RequestMapping(value = "longtermreservationchat.action", method = RequestMethod.GET)
	public String enterGroupChatPost(int reservationNo, Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginuser");
		
		GroupChat groupChat = groupChatService.selectGroupChatByReservationNo(reservationNo);
		int chatNo;
		
		if (groupChat == null) {			
			groupChat = new GroupChat();			
			groupChat.setTitle("title");
			groupChat.setReservationNo(reservationNo);			
			groupChatService.insertGroupChat(groupChat);
			groupChat = groupChatService.selectGroupChatByReservationNo(reservationNo);
			chatNo = groupChat.getChatNo();
			
		} else {
			chatNo = groupChat.getChatNo();			
		}
		
		GroupChatStatement groupChatStatement = groupChatService.selectGroupChatStatementByMemberNo(member.getMemberNo());
		
		if(groupChatStatement == null) {			
			GroupChatStatement gcs = new GroupChatStatement();
			gcs.setChatNo(chatNo);
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
	
	
		
	//////////////////// schedule part //////////////////////
	
	@RequestMapping(value = "insertgroupschedule.action", method = RequestMethod.POST)
	public void insertGroupSchedulePost(GroupSchedule groupSchedule, HttpSession session, int chatNo) {
		
		if(groupScheduleService.selectGroupScheduleByChatNo(chatNo) != null) {
			int i = 10/0;
			System.out.println(i);
			
		} else if (groupSchedule != null) {
			
			if (groupSchedule.getStartDate().compareTo(groupSchedule.getEndDate()) > 0) {
				int i = 10/0;
				System.out.println(i);
			} else if (groupSchedule.getStartDate().compareTo(groupSchedule.getEndDate()) == 0) {
				int i = 10/0;
				System.out.println(i);
			}
			
			groupSchedule.setChatNo(chatNo);			
			groupScheduleService.insertGroupSchedule(groupSchedule);
		}

	}

	@ResponseBody	
	@RequestMapping(value = "view.action", method = RequestMethod.GET)
	public String viewSchedule(int chatNo) {
		
		GroupSchedule groupSchedule = groupScheduleService.selectGroupScheduleByChatNo(chatNo);		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		String json = null;
		
		if (groupSchedule == null) {
			int i = 10/0;
			System.out.println(i);
			return json;
			
		} else {
			json = gson.toJson(groupSchedule);
			return json;
		}
		

	}
	
	@RequestMapping(value = "scheduleupdate.action", method = RequestMethod.POST)
	public void updateSchedule(GroupSchedule groupSchedule) throws IOException {
		
		groupScheduleService.updateGroupSchedule(groupSchedule);
		
	}
	
}









