package com.car.model.service;

import java.util.List;

import com.car.model.dto.Board;
import com.car.model.dto.BoardComent;

public interface BoardService {

	void insertBoard(Board board);

	//int insertReply(Board board);

	Board selectBoardByBoardNo(int number);

	List<Board> selectBoardList(int start, int last);

	int getBoardCount();

	int deleteBoard(int number);

	//void updateBoardReadCount(int number);

	int updateBoard(Board board);

	
	
	//----------------------------Review----------------------------------//
	
	Board selectReviewByBoardNo(int number);

	List<Board> selectReviewList(int start, int last);

	int getReviewCount();

	int deleteReview(int number);

	//void updateBoardReadCount(int number);

	int updateReview(Board board);
	
	
	//----------------------------Coment----------------------------------//
	
	
	BoardComent selectComentByBoardNo(int BoardNo);

	void insertComent(BoardComent coment);

	void updateComent(BoardComent coment);

	void deleteComent(int comentNo);
	
	 
}
