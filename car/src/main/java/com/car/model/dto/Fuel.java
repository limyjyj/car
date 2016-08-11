package com.car.model.dto;

import java.sql.Date;

public class Fuel {

	private int fuelNo;		//주유번호
	private int historyNo;	//차계부번호
	private String type;	//주유형태
	private int perLiter;	//리터당금액
	private int payment;	//주유금액
	private int liter;		//주유리터
	private Date regdate;	//주유날짜
	private String location;//주유장소
	private String content;	//메모
	
	public int getFuelNo() {
		return fuelNo;
	}
	public void setFuelNo(int fuelNo) {
		this.fuelNo = fuelNo;
	}
	public int getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPerLiter() {
		return perLiter;
	}
	public void setPerLiter(int perLiter) {
		this.perLiter = perLiter;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getLiter() {
		return liter;
	}
	public void setLiter(int liter) {
		this.liter = liter;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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
	
	
}