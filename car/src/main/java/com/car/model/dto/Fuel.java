package com.car.model.dto;

import java.util.Date;

public class Fuel {

	private int historyNo;
	private String category;
	private Date regDate;
	private int perLiter;	//리터당금액
	private int liter;		//주유리터
	private int payment;
	private String location;
	private String content;
	private String deleted;
	
	

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
	public int getPerLiter() {
		return perLiter;
	}
	public void setPerLiter(int perLiter) {
		this.perLiter = perLiter;
	}
	public int getLiter() {
		return liter;
	}
	public void setLiter(int liter) {
		this.liter = liter;
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
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
		
	
}
