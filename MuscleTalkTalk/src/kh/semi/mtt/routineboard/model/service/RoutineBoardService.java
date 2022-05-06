package kh.semi.mtt.routineboard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import kh.semi.mtt.routineboard.model.dao.RoutineBoradDao;
import kh.semi.mtt.routineboard.model.vo.RoutineBoardVo;

public class RoutineBoardService {
	private RoutineBoradDao dao = new RoutineBoradDao();
	
	public ArrayList<RoutineBoardVo> readAllRoutineBoard(int startRnum, int endRnum) {
		
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<RoutineBoardVo> result = dao.readAllRoutineBoard(conn, startRnum, endRnum);
		
		close(conn);
		return result;
	}
	
	public int countRoutineBoard() {
		Connection conn = null;
		conn = getConnection();
		int result = dao.countRoutineBoard(conn);
		close(conn);
		return result;
	}
	
	
}
	