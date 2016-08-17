package com.car.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.car.model.dao.BoardDao;
import com.car.model.dto.Board;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	@Qualifier("mysqlBoardDao")
	private BoardDao BoardDao;

	@Override
	public void insertBoard(Board Board) {
		 BoardDao.insertBoard(Board);
	}
			
	@Override
	public List<Board> selectBoardList(int startRow, int i) {
		return BoardDao.selectBoardList(startRow, i);
	}

	@Override
	public Board selectBoardByBoardNo(int number) {
		return BoardDao.selectBoardByBoardNo(number);
	}

	@Override
	public int getBoardCount() {
		return BoardDao.getBoardCount();
	}

	@Override
	public int deleteBoard(int number) {
		return BoardDao.deleteBoard(number);
	}

	@Override
	public int updateBoard(Board board) {
		return BoardDao.updateBoard(board);
	}
	
	
	//--------------------------Review-------------------------------//

	
	@Override
	public Board selectReviewByBoardNo(int number) {
		return BoardDao.selectReviewByBoardNo(number);
	}

	@Override
	public List<Board> selectReviewList(int startRow, int i) {
		return BoardDao.selectReviewList(startRow, i);
	}

	@Override
	public int getReviewCount() {
		return BoardDao.getReviewCount();
	}

	@Override
	public int deleteReview(int number) {
		return BoardDao.deleteReview(number);
	}

	@Override
	public int updateReview(Board board) {
		return BoardDao.updateReview(board);
	}

}
