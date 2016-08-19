package com.car.model.dto;

import java.util.Date;
import java.util.List;

public class Board {
	private int boardNo;
	private String title;
	private String content;
	private Date regDate;
	private String type;
	private String deleted;
	private int memberNo;
	
	private List<BoardComent> coment;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public List<BoardComent> getComent() {
		return coment;
	}
	public void setComent(List<BoardComent> coment) {
		this.coment = coment;
	}

	
	
}
