package com.car.model.dto;

public class GroupChat {

	int chatNo;
	int totalNumber;
	char deleted;
	String title;
	int reservationNo;
	GroupChatStatement groupChatStatement;
	
	public GroupChatStatement getGroupChatStatement() {
		return groupChatStatement;
	}

	public void setGroupChatStatement(GroupChatStatement groupChatStatement) {
		this.groupChatStatement = groupChatStatement;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public int getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}

	public char getDeleted() {
		return deleted;
	}

	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}

}
