package kh.semi.mtt.routine.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.routine.model.vo.RoutineVo;
import kh.semi.mtt.routineexercise.model.vo.RoutineExerciseVo;

public class RoutineDao {
	
//	public int insertRoutine(Connection conn, RoutineVo vo) {
//		
//		int result = 0;
//				
//		String sql ="insert into TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY, "
//				+ "ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, ROUTINE_EXERCISE_TIME,"
//				+ "ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)"
//				+ "values ((select nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 1, 1, 1, 1, 1, 1, 1, 100, 1, 10, null ,null, 1,'f')";
//	
//		
//		
//		return result;
//	}
	
	public int insertRoutine(Connection conn, RoutineVo vo,MemberVo mvo ,ArrayList<RoutineExerciseVo> rouExerVoList) {
		
		int result = 0;
		int memberNo = 13;
		
		String sql = "insert all"
				+ "	    into tb_routine (ROUTINE_NO, MEMBER_NO, ROUTINE_NAME, ROUTINE_DISABLE, ROUTINE_TARGET,"
				+ "	                        ROUTINE_CONTENT, ROUTINE_EXPLANATION)"
				+ "	            values ((select nvl(max(ROUTINE_NO),0)+1 from tb_routine), ?, ?, 'f', ?, ?, 'default')"
				+ "	    ";
		for(RoutineExerciseVo reVo : rouExerVoList) {
			sql +=  "	    into tb_routine_exercise(ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY, "
					+ "	            ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, ROUTINE_EXERCISE_TIME,"
					+ "	            ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)"   //4			8				  10
					+ "	            values ((select nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), ?,(select nvl(max(ROUTINE_NO),0)+1 from tb_routine), ?, ?, ?, ?, ?, ?, ?, ?, null ,null, ?, 'f')";
		}
		sql += "select * from dual";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvo.getMemberNo());
			pstmt.setString(2, vo.getRoutineName());
			pstmt.setString(3, vo.getRoutineTarget()); //목표부위 char형
			pstmt.setString(4, vo.getRoutineContent());
		
			
			for(int i = 0; i < rouExerVoList.size(); i++) {
				pstmt.setInt(5+i, rouExerVoList.get(i).getExerciseNo());      // 운동번호 notnull
				pstmt.setInt(6+i, rouExerVoList.get(i).getRoutineExerciseDay());  // 운동요일 notnull
				pstmt.setInt(7+i, rouExerVoList.get(i).getRoutineWeek());  // 루틴수행주차
				pstmt.setInt(8+i, rouExerVoList.get(i).getRoutineDay());   //  루틴수행n번째일
				pstmt.setInt(9+i, rouExerVoList.get(i).getRoutineExerciseSet());   // 루틴운동 세트수
				pstmt.setInt(10+i, rouExerVoList.get(i).getRoutineExerciseRepeat());  // 루틴운동 반복횟수
				pstmt.setInt(11+i, rouExerVoList.get(i).getRoutineExerciseWeight());  // 루틴무게
				pstmt.setInt(12+i, rouExerVoList.get(i).getRoutineExerciseTime());  // 루틴운동시간
				pstmt.setInt(13+i, rouExerVoList.get(i).getRoutineExerciseDistance());  // 루틴운동 거리
				pstmt.setInt(14+i, rouExerVoList.get(i).getRoutineExerciseSequence());  // n번째운동
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
				
		
		
	    
		return result;
		
	}
}



