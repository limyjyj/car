package com.car.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.car.model.dto.Board;
import com.car.model.dto.BoardComent;
import com.car.model.dto.Member;
import com.car.model.service.BoardService;
import com.car.ui.ThePager;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	@Qualifier("BoardService")
	private BoardService BoardService;
	
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public ModelAndView showBoardList(HttpServletRequest request) {
				
		ModelAndView mav = new ModelAndView();
		//로그인 상태가 아닌 경우 로그인 페이지로 이동
				
		int currentPage = 1;
		int pageSize = 3;
		int dataCount = 0;
		int pagerSize = 2;
		String url = "list.action";
		
		//
		String page = request.getParameter("pageno");		
		if (page != null && page.length() > 0) {
			currentPage = Integer.parseInt(page);
		}		
		int startRow = (currentPage - 1) * pageSize;		
		//데이터베이스에서 데이터 조회
		List<Board> Boards = BoardService.selectBoardList(startRow, pageSize);
		dataCount = BoardService.getBoardCount();
		
		
		
		ThePager pager = 
			new ThePager(dataCount, currentPage, pageSize, pagerSize, url);
		
		mav.setViewName("board/list");
		mav.addObject("Boards", Boards);
		mav.addObject("pageno", currentPage);
		mav.addObject("pager", pager);
		
		return mav;
				
	}
	
	@RequestMapping(value = "detail.action", method = RequestMethod.GET)
	public ModelAndView showBoardByBoardNo(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		//로그인 상태가 아닌 경우 로그인 페이지로 이동
		
				
		//요청 정보에서 내용을 표시할 글번호를 읽고 변수에 저장
		//(없으면 목록으로 이동)
		String BoardNo = request.getParameter("boardno");
		if (BoardNo == null || BoardNo.length() == 0) {
			mav.setViewName("redirect:/board/list.action");					
			return mav;
		}
		int no = Integer.parseInt(BoardNo);
				
		//데이터베이스에서 데이터 조회
		Board Board = BoardService.selectBoardByBoardNo(no);
		
		//조회 실패하면 목록으로 이동
		if (Board == null) {
			mav.setViewName("redirect:/board/list.action");
			return mav;
		}
		
/*		dao.updateBoardReadCount(board.getBoardNo());
		board.setReadCount(board.getReadCount() + 1); */
		
		String pageNo = "1";
		if (request.getParameter("pageno") != null) {
			pageNo = request.getParameter("pageno");
		}
		
		//조회된 데이터를 jsp 처리할 수 있도록 request 객체에 저장
		mav.setViewName("board/detail");
		mav.addObject("board", Board);
		mav.addObject("pageno", pageNo);

		return mav;
		
	}
	
	@RequestMapping(value = "writeform.action", method = RequestMethod.GET)
	public String getBoardWriteForm(@ModelAttribute("Board") Board Board) {
		return "board/writeform";
	}
	
	@RequestMapping(value = "write.action", method = RequestMethod.POST)
	public String writeBoard(@ModelAttribute("Board") Board board, HttpSession session) {
				
		Member member = (Member)session.getAttribute("loginuser");
		board.setMemberNo(member.getMemberNo());
		
		BoardService.insertBoard(board);

		return "redirect:/board/list.action";
	}
	
	@RequestMapping(value = "edit.action", method = RequestMethod.GET)
	public ModelAndView showBoardEditForm(@ModelAttribute("Board") Board Board, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		String boardNo = request.getParameter("boardNo");
		if (boardNo == null || boardNo.length() == 0) {
			mav.setViewName("redirect:/board/list.action");
			return mav;
		}

		Board = BoardService.selectBoardByBoardNo(Integer.parseInt(boardNo));
		
		if (Board == null) {
			mav.setViewName("redirect:/board/list.action");
			return mav;
		}
		
		String pageNo = "1";
		if (request.getParameter("pageno") != null) {
			pageNo = request.getParameter("pageno");
		}
				
		mav.addObject("board", Board);
		mav.addObject("pageno", pageNo);
		mav.setViewName("board/editform");
		return mav;
	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.POST)
	public String updateBoard(HttpServletRequest req) {
		//1. Board 객체를 만들고 사용자가 입력한 데이터를 저장
		Board Board = new Board();
		Board.setBoardNo(
			Integer.parseInt(req.getParameter("boardNo")));
		Board.setTitle(req.getParameter("title"));
		Board.setContent(req.getParameter("content"));

		//2. 데이터베이스에 변경된 내용 적용
		BoardService.updateBoard(Board);
		
		//3. 목록 페이지로 이동
		return "redirect:/board/detail.action" +
			"?boardno=" + Board.getBoardNo() + 
			"&pageno=" + req.getParameter("pageno");
	}
	
	@RequestMapping(value = "delete.action", method = RequestMethod.GET)
	public String deleteBoard(HttpServletRequest req) {
		//1. 요청 데이터 읽기 (글번호)
		String boardNo = req.getParameter("boardNo");
		if (boardNo == null || boardNo.length() == 0) {
			return "redirect:/board/list.action";
		}
		
		//2. 데이터 처리 (db에서 데이터 변경)
		BoardService.deleteBoard(Integer.parseInt(boardNo));
		
		//3. 목록으로 이동 		
		return "redirect:/board/list.action";
	}
	
	
	
//---------------------------------Review-----------------------------------------
	
	
	
	@RequestMapping(value = "list2.action", method = RequestMethod.GET)
	public ModelAndView showReviewList(HttpServletRequest request) {
				
		ModelAndView mav = new ModelAndView();
		//로그인 상태가 아닌 경우 로그인 페이지로 이동
				
		int currentPage = 1;
		int pageSize = 3;
		int dataCount = 0;
		int pagerSize = 2;
		String url = "list2.action";
		
		//
		String page = request.getParameter("pageno");		
		if (page != null && page.length() > 0) {
			currentPage = Integer.parseInt(page);
		}		
		int startRow = (currentPage - 1) * pageSize;		
		//데이터베이스에서 데이터 조회
		List<Board> Boards = BoardService.selectReviewList(startRow, pageSize);
		dataCount = BoardService.getReviewCount();
		
		
		
		ThePager pager = 
			new ThePager(dataCount, currentPage, pageSize, pagerSize, url);
		
		mav.setViewName("board/list2");
		mav.addObject("Boards", Boards);
		mav.addObject("pageno", currentPage);
		mav.addObject("pager", pager);
		
		return mav;
				
	}
	
	@RequestMapping(value = "detail2.action", method = RequestMethod.GET)
	public ModelAndView showReviewByBoardNo(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		//로그인 상태가 아닌 경우 로그인 페이지로 이동
		
				
		//요청 정보에서 내용을 표시할 글번호를 읽고 변수에 저장
		//(없으면 목록으로 이동)
		String BoardNo = request.getParameter("boardno");
		if (BoardNo == null || BoardNo.length() == 0) {
			mav.setViewName("redirect:/board/list2.action");					
			return mav;
		}
		int no = Integer.parseInt(BoardNo);
				
		//데이터베이스에서 데이터 조회
		Board Board = BoardService.selectReviewByBoardNo(no);
		List<BoardComent> coment = BoardService.selectComentByBoardNo(no);
		
		
		//조회 실패하면 목록으로 이동
		if (Board == null) {
			mav.setViewName("redirect:/board/list2.action");
			return mav;
		}
		
		
		String pageNo = "1";
		if (request.getParameter("pageno") != null) {
			pageNo = request.getParameter("pageno");
		}
		
		//조회된 데이터를 jsp 처리할 수 있도록 request 객체에 저장
		mav.setViewName("board/detail2");
		mav.addObject("board", Board);
		mav.addObject("coments", coment);
		mav.addObject("pageno", pageNo);

		return mav;
		
	}
	
	@RequestMapping(value = "writeform2.action", method = RequestMethod.GET)
	public String getReviewWriteForm(@ModelAttribute("Board") Board Board) {
		return "board/writeform2";
	}
	
	@RequestMapping(value = "write2.action", method = RequestMethod.POST)
	public String writeReview(@ModelAttribute("Board") Board board, HttpSession session) {
				
		Member member = (Member)session.getAttribute("loginuser");
		board.setMemberNo(member.getMemberNo());
		
		BoardService.insertBoard(board);

		return "redirect:/board/list2.action";
	}
	
	@RequestMapping(value = "edit2.action", method = RequestMethod.GET)
	public ModelAndView showReviewEditForm(@ModelAttribute("Board") Board Board, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		String boardNo = request.getParameter("boardNo");
		if (boardNo == null || boardNo.length() == 0) {
			mav.setViewName("redirect:/board/list2.action");
			return mav;
		}

		Board = BoardService.selectReviewByBoardNo(Integer.parseInt(boardNo));
		
		if (Board == null) {
			mav.setViewName("redirect:/board/list2.action");
			return mav;
		}
		
		String pageNo = "1";
		if (request.getParameter("pageno") != null) {
			pageNo = request.getParameter("pageno");
		}
				
		mav.addObject("board", Board);
		mav.addObject("pageno", pageNo);
		mav.setViewName("board/editform2");
		return mav;
	}
	
	@RequestMapping(value = "update2.action", method = RequestMethod.POST)
	public String updateReview(HttpServletRequest req) {
		//1. Board 객체를 만들고 사용자가 입력한 데이터를 저장
		Board Board = new Board();
		Board.setBoardNo(
			Integer.parseInt(req.getParameter("boardNo")));
		Board.setTitle(req.getParameter("title"));
		Board.setContent(req.getParameter("content"));

		//2. 데이터베이스에 변경된 내용 적용
		BoardService.updateReview(Board);
		
		//3. 목록 페이지로 이동
		return "redirect:/board/detail2.action" +
			"?boardno=" + Board.getBoardNo() + 
			"&pageno=" + req.getParameter("pageno");
	}
	
	@RequestMapping(value = "delete2.action", method = RequestMethod.GET)
	public String deleteReview(HttpServletRequest req) {
		//1. 요청 데이터 읽기 (글번호)
		String boardNo = req.getParameter("boardNo");
		if (boardNo == null || boardNo.length() == 0) {
			return "redirect:/board/list2.action";
		}
		
		//2. 데이터 처리 (db에서 데이터 변경)
		BoardService.deleteReview(Integer.parseInt(boardNo));
		
		//3. 목록으로 이동 		
		return "redirect:/board/list2.action";
	}
	
	
	//----------------------------------Coment----------------------------------//\
	
	
	@RequestMapping(value = "comentform.action", method = RequestMethod.GET)
	public ModelAndView showBoardComentForm(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		//댓글의 대상 글번호를 읽어서 변수에 저장
		//(대상 글번호는 boardview.jsp에서 전송된 데이터)
		if (req.getParameter("boardNo") == null) {
			mav.setViewName("redirect:/board/list2.action");
			return mav;
		}
		int number = Integer.parseInt(req.getParameter("boardNo"));
		
		//댓글  대상글의 번호로 데이터베이스에서 조회
	
		
		String pageNo = "1";
		if (req.getParameter("pageno") != null) {
			pageNo = req.getParameter("pageno");
		}
		

		mav.addObject("pageno", pageNo);
		mav.setViewName("board/detail2");
		
		return mav;
	}
	
	@RequestMapping(value = "writecoment.action", method = RequestMethod.POST)
	public String writeComent(HttpServletRequest req) {
		
		//1. dto객체 생성 -> 입력 정보 읽어서 dto객체에 저장
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));

		BoardComent coment = new BoardComent();
		coment.setContent(req.getParameter("content"));
		coment.setBoardNo(boardNo);
		coment.setWriter(
			((Member)req.getSession().getAttribute("loginuser")).getMemberId());

		//2. 데이터베이스에 데이터 insert
		BoardService.insertComent(coment);

		//3. boardview로 이동
		String pageNo = req.getParameter("pageno");
		return "redirect:/board/detail2.action?boardno=" + boardNo + "&pageno=" + pageNo;
	}
	
	@RequestMapping(value = "deletecoment.action", method = RequestMethod.GET)
	public String deleteComent(HttpServletRequest req) {
		//1. 댓글번호 읽어서 변수에 저장
		int comentNo = Integer.parseInt(req.getParameter("comentNo"));
		
		//2. 댓글번호에 해당하는 댓글 삭제
		BoardService.deleteComent(comentNo);
		
		//3. view.action로 이동
		return "redirect:/board/detail2.action?" + 
			"boardno=" + req.getParameter("boardNo") + 
			"&pageno=" + req.getParameter("pageno");
		
	}
	
	@RequestMapping(value = "updatecoment.action", method = RequestMethod.POST)
	public String updateComent(HttpServletRequest req) {
		//1. BoardComment 객체 생성 -> 전송된 데이터를 읽어서 저장
		BoardComent coment = new BoardComent();
		coment.setComentNo(
			Integer.parseInt(req.getParameter("comentNo")));
		coment.setContent(req.getParameter("content"));

		//2. 데이터베이스 업데이트
		BoardService.updateComent(coment);

		//3. view.action으로 이동
		return "redirect:/board/detail2.action?" + 
			"boardno=" + req.getParameter("boardNo") + 
			"&pageno=" + req.getParameter("pageno");
	}
	
}

