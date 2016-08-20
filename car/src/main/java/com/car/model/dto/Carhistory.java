package com.car.model.dto;

import java.util.List;

public class Carhistory {
	
	private int historyNo;
	private String category;
	private int carindex; 
	private int deleted;
	private Outcome outcome;
	private Fuel fuel;
	private List<Member>member;
	
	public int getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCarindex() {
		return carindex;
	}
	public void setCarindex(int carindex) {
		this.carindex = carindex;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public Outcome getOutcome() {
		return outcome;
	}
	public void setOutcome(Outcome outcome) {
		this.outcome = outcome;
	}
	public Fuel getFuel() {
		return fuel;
	}
	public void setFuel(Fuel fuel) {
		this.fuel = fuel;
	}
	public List<Member> getMember() {
		return member;
	}
	public void setMember(List<Member> member) {
		this.member = member;
	}
	
	
	
	
	
	

}
