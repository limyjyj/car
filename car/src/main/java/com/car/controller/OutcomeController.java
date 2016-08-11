package com.car.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.car.model.dto.Outcome;
import com.car.model.service.OutcomeService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/outcome/")
public class OutcomeController {

	@Autowired
	@Qualifier("outcomeService")
	private OutcomeService outcomeService;

	@RequestMapping(value = "write.action", method = RequestMethod.POST)
	public void writePost(HttpServletRequest req, HttpServletResponse resp, Outcome outcome) {

		System.out.println("in write, post");

		Gson gson = new Gson();

		PrintWriter writer;
		if (outcome != null) {
			try {
				writer = resp.getWriter();
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/plain;charset=utf-8");
//				outcome.setProductName(outcome.getProductName());
//				outcome.setProductPrice(outcome.getProductPrice());
//				outcome.setDeleted(outcome.getDeleted());
				String json = gson.toJson(outcome);
				writer.println(json);
				outcomeService.insertOutcome(outcome);
				System.out.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
