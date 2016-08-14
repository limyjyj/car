package com.car.model.dto;

import java.util.Date;
import java.util.List;

public class Carhistory {
	
	private int historyno;
	private int memberno;
	private String category;
	private Date regdate;
	private String fee;
	private String liter;
	private int deleted;
	

	
	private List<Car> selectCars;
	
	
	public int getHistoryno() {
		return historyno;
	}
	public void setHistoryno(int historyno) {
		this.historyno = historyno;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getLiter() {
		return liter;
	}
	public void setLiter(String liter) {
		this.liter = liter;
	}
	public List<Car> getSelectCars() {
		return selectCars;
	}
	public void setSelectCars(List<Car> selectCars) {
		this.selectCars = selectCars;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	
}
