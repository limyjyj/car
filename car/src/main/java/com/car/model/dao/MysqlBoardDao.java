package com.car.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.car.model.dto.Member;
import com.car.model.dto.Board;
//import com.mysbl.model.dto.NoticeBoardComment;
import com.car.model.mapper.BoardMapper;

@Repository("mysqlBoardDao")
public class MysqlBoardDao implements BoardDao {

	@Autowired
	@Qualifier("boardMapper")
	private BoardMapper BoardMapper;
	
	public int insertBoard(Board Board) {		
		BoardMapper.insertBoard(Board);
		return Board.getBoardNo();
	}
	
/*	public int insertReply(NoticeBoard board) {
		boardMapper.increaseStepNo(board);
		boardMapper.insertBoardReply(board);
		return board.getBoardNo();
	}*/
	
	///////////////////////////////////

	
/*	public List<NoticeBoard> selectNoticeBoardList(int start, int last) {
		List<NoticeBoard> noticeBoards = noticeBoardMapper.selectNoticeBoardList(map);		
		return noticeBoards;
	}*/
	
	public List<Board> selectBoardList(int start, int count) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("count", count);
		List<Board> BoardList = BoardMapper.selectBoardList(map);
		
		return BoardList;
	}

	///////////////////////////////////////////////
	
	public Board selectBoardByBoardNo(int number) {
		
		Board Board = BoardMapper.selectBoardByBoardNo(number);
		return Board;

	}	
	
	public int getBoardCount() {
		int count = BoardMapper.selectBoardCount();
		return count;
	}
	
	public int deleteBoard(int number) {
		BoardMapper.deleteBoard(number);
		return 0;
	}
	
	public int updateBoard(Board Board) {
		BoardMapper.updateBoard(Board);
		return 0;
	}

	
/*	public void insertComment(BoardComment comment) {
	
		boardMapper.insertBoardComment(comment);
	}*/
	
/*	public void updateComment(BoardComment comment) {
		
		boardMapper.updateComment(comment);
	}*/
	
/*	public void deleteComment(int commentNo) {
		
		boardMapper.deleteComment(commentNo);
	}*/
	

	
}