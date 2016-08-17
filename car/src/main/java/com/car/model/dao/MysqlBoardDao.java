package com.car.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.car.model.dto.Board;
import com.car.model.dto.BoardComent;
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

	public List<Board> selectBoardList(int start, int count) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("count", count);
		List<Board> BoardList = BoardMapper.selectBoardList(map);

		return BoardList;
	}

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

	
	// -----------------------------Review--------------------------------//

	
	@Override
	public List<Board> selectReviewList(int start, int count) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("count", count);
		List<Board> BoardList = BoardMapper.selectReviewList(map);

		return BoardList;
	}

	@Override
	public Board selectReviewByBoardNo(int number) {
		Board Board = BoardMapper.selectReviewByBoardNo(number);
		return Board;
	}

	@Override
	public int getReviewCount() {
		int count = BoardMapper.selectReviewCount();
		return count;
	}

	@Override
	public int deleteReview(int number) {
		BoardMapper.deleteReview(number);
		return 0;
	}

	@Override
	public int updateReview(Board Board) {
		BoardMapper.updateReview(Board);
		return 0;
	}

	
	// ------------------------------Coment----------------------------//

	
	@Override
	public BoardComent selectComentByBoardNo(int number) {
		BoardComent coment = BoardMapper.selectComentByBoardNo(number);
		return coment;
	}

	
	 @Override 
	 public void insertComent(BoardComent coment) {
	 BoardMapper.insertBoardComent(coment); 
	 
	 }

	
	 @Override 
	 public void updateComent(BoardComent coment) {
	 BoardMapper.updateComent(coment); 
	 
	 }
	 
	 @Override 
	 public void deleteComent(int comentNo) {
	 BoardMapper.deleteComent(comentNo); 
	 
	 }
	 

}