package kh.semi.mtt.board.model.service;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import kh.semi.mtt.board.model.dao.BoardDao;
import kh.semi.mtt.board.model.vo.BoardVo;

public class BoardService {
	private BoardDao dao = new BoardDao();
	
	
	
	public int insertBoard(BoardVo vo) {
		Connection conn = null;
		
		conn = getConnection();
		
		int result = dao.insertBoard(conn, vo); 
		
		close(conn);
		return result;
	}
	
	public BoardVo readBoard(int boardNo) {
		Connection conn = null;
		conn = getConnection();
		
		BoardVo result = dao.readBoard(conn, boardNo);
		close(conn);
		return result;
	}
	

	public ArrayList<BoardVo> readAllBoard(int startRnum, int endRnum){
		
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<BoardVo> result = dao.readAllBoard(conn, startRnum, endRnum);
		close(conn);
		return result;
		
	}
	public int countBoard() {
		Connection conn = null;
		conn = getConnection();
		
		int result =  dao.countBoard(conn);
		close(conn);
		return result;
		
	}
	
	
	
}
