package com.car.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.car.model.dto.Board;
//import com.mysbl.model.dto.BoardComment;

public interface BoardMapper {
	
	void insertBoard(Board Board);
	
	List<Board> selectBoardList(HashMap<String, Object> map);
	
	Board selectBoardByBoardNo(int BoardNo);
	
	
	int selectBoardCount();
	
	void deleteBoard(int BoardNo);
	
	void updateBoard(Board Board);
	
	//void insertBoardReply(Board board);
	//void increaseStepNo(NoticeBoard noticeBoard);
	//void increaseBoardReadCount(int boardNo);
	//void insertBoardComment(BoardComment comment);
	//void updateComment(BoardComment comment);
	//void deleteComment(int commentNo);
	

}
