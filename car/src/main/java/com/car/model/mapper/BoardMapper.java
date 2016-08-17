package com.car.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.car.model.dto.Board;
//import com.mysbl.model.dto.BoardComment;
import com.car.model.dto.BoardComent;

public interface BoardMapper {

	void insertBoard(Board Board);

	List<Board> selectBoardList(HashMap<String, Object> map);

	Board selectBoardByBoardNo(int BoardNo);

	int selectBoardCount();

	void deleteBoard(int BoardNo);

	void updateBoard(Board Board);

	
	// --------------------------Review-------------------------------//

	
	List<Board> selectReviewList(HashMap<String, Object> map);

	Board selectReviewByBoardNo(int BoardNo);

	int selectReviewCount();

	void deleteReview(int BoardNo);

	void updateReview(Board Board);

	
	// --------------------------------Comment--------------------------------//

	
	BoardComent selectComentByBoardNo(int BoardNo);
	
	void insertBoardComent(BoardComent coment);
	
	void updateComent(BoardComent coment);
	
	void deleteComent(int comentNo);

}
