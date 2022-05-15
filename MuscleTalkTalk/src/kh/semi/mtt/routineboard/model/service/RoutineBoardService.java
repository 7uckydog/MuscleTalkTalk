package kh.semi.mtt.routineboard.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.routineboard.model.dao.RoutineBoradDao;
import kh.semi.mtt.routineboard.model.vo.RoutineBoardVo;

public class RoutineBoardService {
	private RoutineBoradDao dao = new RoutineBoradDao();
	
	
	
	public int deleteRoutineBoard(RoutineBoardVo rvo) {
		Connection conn = null;
		conn = getConnection();
		int result = dao.deleteRoutineBoard(conn, rvo);
		close(conn);
		return result;
		
	}
	
	
	public Map<String, Object> readRoutineBoardRouintenInformation(int routineboardNo) {
		
		Connection conn = null;
		conn = getConnection();
		
		Map<String, Object> result2 = dao.readRoutineBoardRouintenInformation(conn, routineboardNo);
		close(conn);
		return result2;
		
	}
	
	public ArrayList<RoutineBoardVo> readAllRoutineBoard(int startRnum, int endRnum) {
		
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<RoutineBoardVo> result = dao.readAllRoutineBoard(conn, startRnum, endRnum);
		
		close(conn);
		return result;
	}
	
	public ArrayList<RoutineBoardVo> mainRoutineBoard() {
		
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<RoutineBoardVo> result = dao.mainRoutineBoard(conn);
		
		close(conn);
		return result;
	}
	
	public RoutineBoardVo readRoutineBoard(int routineboardNo) {
		Connection conn = null;
		conn = getConnection();
		
		RoutineBoardVo result = dao.readRoutineBoard(conn, routineboardNo);
		close(conn);
		return result;
		
		
		
	}
	
	
	public int insertRoutineboard (RoutineBoardVo rvo, MemberVo mvo) {
		Connection conn = null;
		conn = getConnection();
		
		int result = dao.insertRoutineboard(conn, rvo, mvo);
		close(conn);
		return result;
	}
	
	public int routineBoardViewCount(RoutineBoardVo rvo) {
		Connection conn = null;
		conn = getConnection();
		
		int result = dao.routineBoardViewCount(conn, rvo);
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
	