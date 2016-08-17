package com.car.model.dto;

import java.util.Date;

public class Outcome {

	private int outcomeNo;	//지출번호
	private int historyNo;	//차계부번호
	private String cartegory;//지출항목
	private int payment;	//지출금액
	private Date regDate;	//Datr형식으로 받기
	private String location;//지출장소
	private String content;	//내용
	
	public int getOutcomeNo() {
		return outcomeNo;
	}
	public void setOutcomeNo(int outcomeNo) {
		this.outcomeNo = outcomeNo;
	}
	public int getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}
	public String getCartegory() {
		return cartegory;
	}
	public void setCartegory(String cartegory) {
		this.cartegory = cartegory;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
