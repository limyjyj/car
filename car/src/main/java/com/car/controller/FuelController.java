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

import com.car.model.dto.Fuel;
import com.car.model.service.FuelService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/fuel/")
public class FuelController {

	@InitBinder
	public void binder(WebDataBinder binder) {
	    binder.registerCustomEditor(Date.class, 
	            new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	@Autowired
	@Qualifier("fuelService")
	private FuelService fuelService;

	@RequestMapping(value = "write.action", method = RequestMethod.POST)
	public void writePost(HttpServletRequest req, HttpServletResponse resp, Fuel fuel) {

		System.out.println("in write, post");

		Gson gson = new Gson();

		PrintWriter writer;
		if (fuel != null) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");

				String json = gson.toJson(fuel);
				writer.println(json);
				fuelService.insertFuel(fuel);
				System.out.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	@RequestMapping(value = "write.action", method = RequestMethod.GET)
	public void writeGet(HttpServletRequest req, HttpServletResponse resp, Fuel fuel) {
				
		System.out.println("in register, get");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				
		PrintWriter writer;
		if (fuel != null) {
			try {
				writer = resp.getWriter();
				resp.setContentType("text/plain;charset=utf-8");
				String json = gson.toJson(fuel);
				
				fuelService.insertFuel(fuel);
				
				writer.println(json);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 출력
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public void listGet(HttpServletRequest req, HttpServletResponse resp) {

		System.out.println("in register, post");

		ArrayList<Fuel> fuel = (ArrayList) fuelService.selectFuelList();

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		PrintWriter writer;
		if (fuel.size() > 0) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");

				String json = null;

				json = gson.toJson(fuel);

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

		ArrayList<Fuel> fuel = (ArrayList) fuelService.selectFuelList();

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		PrintWriter writer;
		if (fuel.size() > 0) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");

				String json = null;

				json = gson.toJson(fuel);

				writer.println(json);
				System.out.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// outcomeNo로 불러오기
	@RequestMapping(value = "listbyfuelno.action", method = RequestMethod.GET)
	public void selectOutcomeByOutcomeNoGet(HttpServletRequest req, HttpServletResponse resp, int fuelNo) {

		System.out.println("in register, get");
		Fuel fuel = fuelService.selectFuelByFuelNo(fuelNo);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		PrintWriter writer;
		if (fuel != null) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");

				String json = gson.toJson(fuel);

				writer.println(json);
				System.out.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "listbyfuelno.action", method = RequestMethod.POST)
	public void selectOutcomeByOutcomeNoPOST(HttpServletRequest req, HttpServletResponse resp, int fuelNo) {

		System.out.println("in register, get");
		Fuel fuel = fuelService.selectFuelByFuelNo(fuelNo);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		PrintWriter writer;
		if (fuel != null) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");

				String json = gson.toJson(fuel);

				writer.println(json);
				System.out.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// 수정
	@RequestMapping(value = "update.action", method = RequestMethod.GET)
	public void updateGet(HttpServletRequest req, HttpServletResponse resp, Fuel fuel, int fuelNo) {

		System.out.println("in register, update get");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		PrintWriter writer;
		if (fuel != null) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");
				fuelService.updateFuel(fuel);

				Fuel updateFuel = fuelService.selectFuelByFuelNo(fuelNo);

				String json = gson.toJson(updateFuel);

				writer.println(json);
				System.out.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "update.action", method = RequestMethod.POST)
	public void update(HttpServletRequest req, HttpServletResponse resp, Fuel fuel) {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		PrintWriter writer;
		if (fuel != null) {
			try {
				writer = resp.getWriter();
				resp.setContentType("text/plain;charset=utf-8");

				String json = gson.toJson(fuel);
				fuelService.updateFuel(fuel);
				writer.println(json);

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
