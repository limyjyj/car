package com.car.model.dao;

import java.util.List;

import com.car.model.dto.Board;
import com.car.model.dto.BoardComent;


	public interface BoardDao {

	int insertBoard(Board board);

	List<Board> selectBoardList(int start, int last);

	Board selectBoardByBoardNo(int number);

	int getBoardCount();

	int deleteBoard(int number);

	int updateBoard(Board board);
	
	
	//------------------------------Review------------------------------//
	
	
	List<Board> selectReviewList(int start, int last);

	Board selectReviewByBoardNo(int number);

	int getReviewCount();

	int deleteReview(int number);

	int updateReview(Board board);
	
	
	//--------------------------------Coment---------------------------//
	
	
	List<BoardComent> selectComentByBoardNo(int BoardNo);

	void insertComent(BoardComent coment);

	void updateComent(BoardComent coment);

	void deleteComent(int comentNo);

}