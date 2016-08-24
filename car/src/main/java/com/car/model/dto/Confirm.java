package com.car.model.dto;

public class Confirm {
	
	private int memberNo;
	private int reservationNo;
	private int accept;//0 : not accept, 1 : accept
	
	private Member member;
	
	
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
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public int getAccept() {
		return accept;
	}
	public void setAccept(int accept) {
		this.accept = accept;
	}
	
}
