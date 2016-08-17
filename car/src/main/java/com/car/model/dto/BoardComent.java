package com.car.model.dto;

import java.util.Date;

public class BoardComent {
	private int comentNo;
	private String content;
	private Date regDate;
	private int boardNo;
	private String deleted;
	private String writer;
	
	public int getComentNo() {
		return comentNo;
	}
	public void setComentNo(int comentNo) {
		this.comentNo = comentNo;
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
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

	
}
