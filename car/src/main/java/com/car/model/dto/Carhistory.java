package com.car.model.dto;

import java.util.List;

public class Carhistory {
	
	private int historyNo;
	private String category;
	private int carindex; 
	private int deleted;
	private List<Car> car;
	
	
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
	public List<Car> getCar() {
		return car;
	}
	public void setCar(List<Car> car) {
		this.car = car;
	}
	
	
	
	

}
