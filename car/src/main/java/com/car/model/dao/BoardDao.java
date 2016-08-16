package com.car.model.dao;

import java.util.List;

import com.car.model.dto.Board;
//import com.mysbl.model.dto.NoticeBoardComment;

public interface BoardDao {

	int insertBoard(Board board);

	List<Board> selectBoardList(int start, int last);

	Board selectBoardByBoardNo(int number);

	int getBoardCount();

	int deleteBoard(int number);

	int updateBoard(Board board);

	//void insertComment(NoticeBoardComment comment);

	//void updateComment(NoticeBoardComment comment);

	//void deleteComment(int commentNo);

}