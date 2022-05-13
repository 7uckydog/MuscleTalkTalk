package kh.semi.mtt.totalboard.service;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.mtt.board.model.dao.BoardDao;
import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;
import kh.semi.mtt.totalboard.model.vo.TotalBoardVo;

public class TotalBoardService {
	private BoardDao dao = new BoardDao();
	
	public ArrayList<TotalBoardVo> totalBoardReadAll(int startRnum, int endRnum, int filterint, String search){
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<TotalBoardVo> result = dao.totalBoardReadAll(conn, startRnum, endRnum, filterint, search);
		
		close(conn);
		return result;
		
	}
	
	public int countTotalBoard () {
		Connection conn = null;
		conn = getConnection();
		
		int result = dao.countTotalBoard(conn);
		
		close(conn);
		return result;
		
	}
	
}
