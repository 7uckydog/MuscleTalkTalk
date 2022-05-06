package kh.semi.mtt.exercise.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import kh.semi.mtt.exercise.model.dao.ExerciseDao;
import kh.semi.mtt.exercise.model.vo.ExerciseVo;

public class ExerciseService {
	private ExerciseDao dao = new ExerciseDao();
	
	
	public ArrayList<ExerciseVo> exerciseRead(String exercisePart) {
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<ExerciseVo> result = dao.exerciseRead(conn, exercisePart);
		close(conn);
		return result;
		
	}
}
