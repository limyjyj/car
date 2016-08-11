package com.car.model.dto;

<<<<<<< HEAD
import java.util.Date;

public class Outcome {

	private int historyno;
	private String category;
	private int payment;
	private Date regdate;
	private String location;
	private String content;
}
=======
import java.sql.Date;

public class Outcome {

	private int outcomeNo;	//지출번호
	private int historyNo;	//차계부번호
	private String category;//지출항목
	private int payment;	//지출금액
	private Date regeDate;	//지출날짜
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public Date getRegeDate() {
		return regeDate;
	}
	public void setRegeDate(Date regeDate) {
		this.regeDate = regeDate;
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
>>>>>>> branch 'master' of https://github.com/limyjyj/car.git
