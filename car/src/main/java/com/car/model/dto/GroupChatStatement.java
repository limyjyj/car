package com.car.model.dto;

public class GroupChatStatement {

	int memberNo;
	int chatNo;
	GroupChat groupChat;
	Member member;
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public GroupChat getGroupChat() {
		return groupChat;
	}

	public void setGroupChat(GroupChat groupChat) {
		this.groupChat = groupChat;
	}



	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

}
