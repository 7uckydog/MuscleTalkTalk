package kh.semi.mtt.routine.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.routine.model.dao.RoutineDao;
import kh.semi.mtt.routine.model.vo.RoutineVo;
import kh.semi.mtt.routineexercise.model.vo.RoutineExerciseVo;

public class RoutineService {
	private RoutineDao dao = new RoutineDao();
	
	public int insertRoutine(RoutineVo vo,MemberVo mvo ,ArrayList<RoutineExerciseVo> rouExerVoList) {
		
		Connection conn = null;
		conn = getConnection();
		
		int result = dao.insertRoutine(conn, vo,mvo, rouExerVoList);
		close(conn);
		
		return result;
	}
	
	
	public Map<String, Object> myRoutineReadAll(MemberVo mvo){
		
		Connection conn = null;
		conn = getConnection();
		
		Map<String, Object> result = dao.myRoutineReadAll(conn, mvo);
		close(conn);
		
		return result;
		
		
		
	}
	
	public int MyRoutineDelete(RoutineVo rvo) {
		Connection conn = null;
		conn = getConnection();
		int result = dao.MyRoutineDelete(conn, rvo);
		close(conn);
		return result;
		
		
	}
	
	
	
	
}
