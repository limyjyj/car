package com.car.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.car.model.dto.Outcome;
import com.car.model.service.OutcomeService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/outcome/")
public class OutcomeController {

	//날짜개꿀
	@InitBinder
	public void binder(WebDataBinder binder) {
	    binder.registerCustomEditor(Date.class, 
	            new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	@Autowired
	@Qualifier("outcomeService")
	private OutcomeService outcomeService;

	
	
	// 입력
	@RequestMapping(value = "write.action", method = RequestMethod.POST)
	public String writePost(HttpServletRequest req, HttpServletResponse resp, Outcome outcome) {

		System.out.println("in write, post");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		PrintWriter writer;
		if (outcome != null) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");
				/*
				 * outcome.setCartegory(outcome.getCartegory());
				 * outcome.setPayment(outcome.getPayment());
				 * outcome.setRegDate(outcome.getRegDate());
				 * outcome.setLocation(outcome.getLocation());
				 * outcome.setContent(outcome.getContent());
				 * outcome.setHistoryNo(outcome.getHistoryNo());
				 */
				String json = gson.toJson(outcome);
				writer.println(json);
				outcomeService.insertOutcome(outcome);
				
				System.out.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/carhistory/list.action";

	}

	@RequestMapping(value = "writeform.action", method = RequestMethod.GET)
	public String writeGet(HttpServletRequest req, HttpServletResponse resp, Outcome outcome) {
		return "outcome/writeform";
		
//		System.out.println("in register, get");
//
//		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//				
//		PrintWriter writer;
//		if (outcome != null) {
//			try {
//				writer = resp.getWriter();
//				resp.setContentType("text/plain;charset=utf-8");
//				String json = gson.toJson(outcome);
//								
//				outcomeService.insertOutcome(outcome);
//				
//				writer.println(json);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
	}

	// 출력
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public void listGet(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("in register, post");

			ArrayList<Outcome> outcome = (ArrayList) outcomeService.selectOutcomeList();
		
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		PrintWriter writer;
		if (outcome.size() > 0) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");

				String json = null;

				json = gson.toJson(outcome);

				writer.println(json);
				System.out.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "list.action", method = RequestMethod.POST)
	public void listPost(HttpServletRequest req, HttpServletResponse resp) {

		System.out.println("in register, post");

		ArrayList<Outcome> outcome = (ArrayList) outcomeService.selectOutcomeList();

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		PrintWriter writer;
		if (outcome.size() > 0) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");

				String json = null;

				json = gson.toJson(outcome);

				writer.println(json);
				System.out.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	//outcomeNo로 불러오기
	@RequestMapping(value = "listbyoutcomeno.action", method = RequestMethod.GET)
	public void selectOutcomeByOutcomeNoGet(HttpServletRequest req, HttpServletResponse resp, int outcomeNo) {

		System.out.println("in register, get");
		Outcome outcome = outcomeService.selectOutcomeByOutcomeNo(outcomeNo);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		PrintWriter writer;
		if (outcome != null) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");

				String json = gson.toJson(outcome);

				writer.println(json);
				System.out.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "listbyoutcomeno.action", method = RequestMethod.POST)
	public void selectOutcomeByOutcomeNoPOST(HttpServletRequest req, HttpServletResponse resp, int outcomeNo) {

		System.out.println("in register, get");
		Outcome outcome = outcomeService.selectOutcomeByOutcomeNo(outcomeNo);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		PrintWriter writer;
		if (outcome != null) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");

				String json = gson.toJson(outcome);

				writer.println(json);
				System.out.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	//수정
	@RequestMapping(value = "update.action", method = RequestMethod.GET)
	public void updateGet(HttpServletRequest req, HttpServletResponse resp, Outcome outcome, int outcomeNo) {

		System.out.println("in register, update get");
		
		//outcome = outcomeService.selectOutcomeByOutcomeNo(outcomeNo);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		PrintWriter writer;
		if (outcome != null) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");
								
				outcomeService.updateOutcome(outcome);
				
				Outcome updateOutcome = outcomeService.selectOutcomeByOutcomeNo(outcomeNo);

				String json = gson.toJson(updateOutcome);

				writer.println(json);
				System.out.println(json);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.POST)
	public void update(HttpServletRequest req, HttpServletResponse resp, Outcome outcome) {
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		PrintWriter writer;
		if (outcome != null) {
			try {
				writer = resp.getWriter();
				resp.setContentType("text/plain;charset=utf-8");
				
				String json = gson.toJson(outcome);
				outcomeService.updateOutcome(outcome);
				writer.println(json);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}


