package com.car.model.dto;

import java.sql.Date;
import java.util.List;


public class Reservation {

	private int reservationNo;
	private int memberNo;
	private String type; // 장기 단기
	private String purpose; // 출퇴근 및 목적
	private String departure; // 출발지
	private String arrival; // 도착지
	private String frequency; // 단기 장기
	private Date regDate; // 실시간
	private Date date; //경주꺼
	private String totalMemeber; // 인원
	private String content; //기타내용

	
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getDeparture() {
		return departure;
	}
	public void setDeparture(String departure) {
		this.departure = departure;
	}
	public String getArrival() {
		return arrival;
	}
	public void setArrival(String arrival) {
		this.arrival = arrival;
	}
	public String getFrequency() {
		return frequency;
	}
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTotalMemeber() {
		return totalMemeber;
	}
	public void setTotalMemeber(String totalMemeber) {
		this.totalMemeber = totalMemeber;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}


}