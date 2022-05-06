package kh.semi.mtt.exercise.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kh.semi.mtt.exercise.model.vo.ExerciseVo;

public class ExerciseDao {
	
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	public ArrayList<ExerciseVo> exerciseRead(Connection conn, String exercisePart) {
		ArrayList<ExerciseVo> evoList = null;
		
		String sql = "select * "
				+ " from tb_exercise "
				+ " where exercise_part = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, exercisePart);
			rs = pstmt.executeQuery();
			if(rs != null) {
				evoList = new ArrayList<ExerciseVo>();
				
			}
			while(rs.next()){
				ExerciseVo evo = new ExerciseVo();
				evo.setExerciseNo(rs.getInt("EXERCISE_NO"));
				evo.setExerciseName(rs.getString("EXERCISE_NAME"));
				evo.setExercisePart(rs.getString("exercise_Part"));
				evoList.add(evo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);	
		}
		
		return evoList;
		
	}
}
