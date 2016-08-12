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
import com.car.model.service.GroupChatService;
import com.google.gson.Gson;


@Controller
@RequestMapping(value = "/groupchat/")
public class GroupChatController {
	
	@Autowired
	@Qualifier("groupChatService")
	private GroupChatService groupChatService;
	
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public String groupChatList(HttpServletRequest req, HttpServletResponse resp, Model model) {
		
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
				
		return "groupchat/list";
	}
	
	@RequestMapping(value = "create.action", method = RequestMethod.GET)
	public String createGet(HttpServletRequest req, HttpServletResponse resp, @Valid @ModelAttribute GroupChat groupChat) {
		
		Gson gson = new Gson();
		PrintWriter writer;
		
		if (groupChat != null) {
			try {
				writer = resp.getWriter();
				String json = gson.toJson(groupChat);
				
				groupChatService.createGroupChat(groupChat);
				writer.println(json);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		return "groupchat/chatroom";
		
	}
	
	
	@RequestMapping(value = "create.action", method = RequestMethod.POST)
	public String createPost(HttpServletRequest req, HttpServletResponse resp, @Valid @ModelAttribute GroupChat groupChat) {
		
		Gson gson = new Gson();
		PrintWriter writer;
		
		if (groupChat != null) {
			try {
				writer = resp.getWriter();
				String json = gson.toJson(groupChat);
				
				groupChatService.createGroupChat(groupChat);
				writer.println(json);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		return "groupchat/chatroom";
		
	}
	
	
	@RequestMapping(value = "update.action", method = RequestMethod.POST)
	public void update(HttpServletRequest req, HttpServletResponse resp, 
			@Valid @ModelAttribute GroupChat groupChat) {		
		
		Gson gson = new Gson();
		PrintWriter writer;
		
		if (groupChat != null) {
			try {
				writer = resp.getWriter();
				String json = gson.toJson(groupChat);
				groupChatService.updateGroupChat(groupChat);
				writer.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping(value = "delete.action", method = RequestMethod.GET)
	public String delete(@Valid @ModelAttribute int groupChatNo) {	
		
		groupChatService.deleteGroupChat(groupChatNo);
		
		return "redirect:/groupchat/list.action"; 
		
	}
	
}









