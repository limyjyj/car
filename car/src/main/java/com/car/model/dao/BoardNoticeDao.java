package com.car.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.project.model.dto.BoardNotice;


public class BoardNoticeDao {
	
	String dsn = "oracle";

	public void insertBoardNotice (BoardNotice boardNotice) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		try {
			conn = ConnectionHelper.getConnection(dsn);
			
			StringBuilder sql = new StringBuilder(256);
			sql.append("INSERT INTO board_notice")
			   .append("(regNo, title, content, category, category_Detail, memberId) ")
			   .append("VALUES ")
			   .append("(BOARD_NOTICE_SEQUENCE.nextVal, ?, ?, ?, ?, ?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, boardNotice.getTitle());
			pstmt.setString(2, boardNotice.getContent());
			pstmt.setString(3, boardNotice.getCategory());
			pstmt.setString(4, boardNotice.getCategoryDetail());
			pstmt.setString(5, boardNotice.getMemberId());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception ex) {
			try { conn.rollback(); } catch (Exception ex2) {}
			ex.printStackTrace();
		} finally {
			//6. 연결닫기
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}			
			try { conn.close(); } catch (Exception ex) {}
		}
		
	
	}
	
		
	public List<BoardNotice> selectBoardNoticeList() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;//조회 결과에 접근하는 참조 변수
		
		//데이터베이스의 데이터를 읽어서 저장할 객체 컬렉션
		ArrayList<BoardNotice> boardNotices = new ArrayList<BoardNotice>();
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			StringBuilder sql = new StringBuilder(512);
			sql.append("SELECT regNo, title, reg_Date, content, category, category_Detail, memberId ")
			   .append("FROM board_notice ");
			pstmt = conn.prepareStatement(sql.toString());			
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardNotice boardNotice = new BoardNotice();

				boardNotice.setRegNo(rs.getInt(1));
				boardNotice.setTitle(rs.getString(2));
				boardNotice.setRegDate(rs.getString(3));
				boardNotice.setContent(rs.getString(4));
				boardNotice.setCategory(rs.getString(5));
				boardNotice.setCategoryDetail(rs.getString(6));
				boardNotice.setMemberId(rs.getString(7));
				
				boardNotices.add(boardNotice);
				
		}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			//6. 연결닫기
			if (rs != null) try { rs.close(); } catch (Exception ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
			if (conn != null) try { conn.close(); } catch (Exception ex) {}
		}
		
		return boardNotices;
	}


	public int updateBoardNotice (BoardNotice boardNotice) { //수정
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			String sql = 
				"UPDATE board_notice " +
				"SET title = ?, content = ?, category = ?, category_Detail = ? " + 
				"WHERE regNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNotice.getTitle());
			pstmt.setString(2, boardNotice.getContent());
			pstmt.setString(3, boardNotice.getCategory());
			pstmt.setString(4, boardNotice.getCategoryDetail());
			pstmt.setInt(5, boardNotice.getRegNo());
			
			count = pstmt.executeUpdate();
			
		} catch (Exception ex) {
			count = 0;
			ex.printStackTrace();
		} finally {
			try { if (pstmt != null) pstmt.close(); } catch (Exception ex) { }
			try { if (conn != null) conn.close(); } catch (Exception ex) { }
		}
		return count;
	}
	
	public BoardNotice selectBoardNoticeByRegNo(int number) { //상세보기
		Connection conn = null;
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		BoardNotice boardNotice= null;
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			StringBuffer sql = new StringBuffer(300);
			sql.append("SELECT regNo, title, reg_Date, content, category, category_Detail, memberId "); 
			sql.append("FROM board_Notice ");
			sql.append("WHERE regNo = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardNotice = new BoardNotice();
				boardNotice.setRegNo(rs.getInt(1));
				boardNotice.setTitle(rs.getString(2));
				boardNotice.setRegDate(rs.getString(3));
				boardNotice.setContent(rs.getString(4));
				boardNotice.setCategory(rs.getString(5));
				boardNotice.setCategoryDetail(rs.getString(6));
				boardNotice.setMemberId(rs.getString(7));
				
			}			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try { if (pstmt2 != null) pstmt2.close(); } catch (Exception ex) { }
			try { if (rs != null) rs.close(); } catch (Exception ex) { }
			try { if (pstmt != null) pstmt.close(); } catch (Exception ex) { }
			try { if (conn != null) conn.close(); } catch (Exception ex) { }
		}
		return boardNotice;
	}
	
	public int deleteBoard(int number) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			conn = ConnectionHelper.getConnection(dsn);
			String sql =
				"DELETE " +
				"FROM board_notice " +
				"WHERE regNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			count = pstmt.executeUpdate();
		} catch (Exception ex) {
			count = 0;
			ex.printStackTrace();
		} finally {
			try { if (pstmt != null) pstmt.close(); } catch (Exception ex) { }
			try { if (conn != null) conn.close(); } catch (Exception ex) { }
		}
		return count;
	}
	
}