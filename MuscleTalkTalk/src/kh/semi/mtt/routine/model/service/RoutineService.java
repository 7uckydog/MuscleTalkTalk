package kh.semi.mtt.routine.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import kh.semi.mtt.routine.model.dao.RoutineDao;
import kh.semi.mtt.routine.model.vo.RoutineVo;
import kh.semi.mtt.routineexercise.model.vo.RoutineExerciseVo;

public class RoutineService {
	private RoutineDao dao = new RoutineDao();
	
	public int insertRoutine(RoutineVo vo, ArrayList<RoutineExerciseVo> rouExerVoList) {
		
		Connection conn = null;
		conn = getConnection();
		
		int result = dao.insertRoutine(conn, vo, rouExerVoList);
		close(conn);
		
		return result;
	}
}
