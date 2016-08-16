package com.car.model.service;

import java.util.List;

import com.car.model.dto.Board;

public interface BoardService {

	void insertBoard(Board noticeboard);

	//int insertReply(NoticeBoard noticeboard);

	Board selectBoardByBoardNo(int number);

	List<Board> selectBoardList(int start, int last);

	int getBoardCount();

	int deleteBoard(int number);

	//void updateBoardReadCount(int number);

	int updateBoard(Board board);
	
	//List<NoticeBoard> selectAllNoticeBoardList();	
}
