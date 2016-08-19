package com.car.model.dto;

public class BoardUpload {
	private int boardNo;
	private int fileNo;
	private String savedFileName;
	private String userFileName;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getSavedFileName() {
		return savedFileName;
	}
	public void setSavedFileName(String savedfileName) {
		this.savedFileName = savedfileName;
	}
	public String getUserFileName() {
		return userFileName;
	}
	public void setUserFileName(String userfileName) {
		this.userFileName = userfileName;
	}
	
	
}
