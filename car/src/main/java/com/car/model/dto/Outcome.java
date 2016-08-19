package com.car.model.dto;

import java.util.Date;

public class Outcome {

	private int outcomeNo;	//지출번호
	private String category;
	private Date regDate;
	private int payment;
	private String location;
	private String content;
	private int historyNo;
	
	
	public int getOutcomeNo() {
		return outcomeNo;
	}
	public void setOutcomeNo(int outcomeNo) {
		this.outcomeNo = outcomeNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}
	
	
	
	
	
	
}
