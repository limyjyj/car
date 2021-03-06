package com.car.model.dto;

import java.sql.Date;
import java.util.List;

public class Car {
	
	private int memberNo;
	private int carindex;
	private int historyno;
	private String model;
	private Date regdate;
	private String carno;
	private int totaldistance;
	private int totaloutcome;
	private int deleted;
	private List<Carhistory> car;
	
	
	
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public int getCarindex() {
		return carindex;
	}
	public void setCarindex(int carindex) {
		this.carindex = carindex;
	}
	public int getHistoryno() {
		return historyno;
	}
	public void setHistoryno(int historyno) {
		this.historyno = historyno;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getCarno() {
		return carno;
	}
	public void setCarno(String carno) {
		this.carno = carno;
	}
	public int getTotaldistance() {
		return totaldistance;
	}
	public void setTotaldistance(int totaldistance) {
		this.totaldistance = totaldistance;
	}
	public int getTotaloutcome() {
		return totaloutcome;
	}
	public void setTotaloutcome(int totaloutcome) {
		this.totaloutcome = totaloutcome;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public List<Carhistory> getCar() {
		return car;
	}
	public void setCar(List<Carhistory> car) {
		this.car = car;
	}

	
}
