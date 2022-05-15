package kh.semi.mtt.routine.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import kh.semi.mtt.exercise.model.vo.ExerciseVo;
import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.routine.model.vo.RoutineVo;
import kh.semi.mtt.routineexercise.model.vo.RoutineExerciseVo;

public class RoutineDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
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
				+ "	            values ((select nvl(max(ROUTINE_NO),0)+1 from tb_routine), ?, ?, 'F', ?, ?, 'default')"
				+ "	    ";
		int routineExerciseNo = 1;
		for(RoutineExerciseVo reVo : rouExerVoList) {
			sql +=  "	    into tb_routine_exercise(ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY, "
					+ "	            ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, ROUTINE_EXERCISE_TIME,"
					+ "	            ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)"   //4			8				  10
					+ "	            values ((select nvl(max(ROUTINE_EXERCISE_NO),0)+"+(routineExerciseNo++)+" from TB_ROUTINE_EXERCISE), (select EXERCISE_NO"
					+ "    			from tb_exercise"
					+ "    			where exercise_name = ?),(select nvl(max(ROUTINE_NO),0)+1 from tb_routine)"
					+ "				, ?, ?, null, ?, ?, ?, null, null, null ,null, ?, 'F') ";
		}
		sql += "select * from dual";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvo.getMemberNo());
			pstmt.setString(2, vo.getRoutineName());
			pstmt.setString(3, vo.getRoutineTarget()); //목표부위 char형
			pstmt.setString(4, vo.getRoutineContent());
		
			
			for(int i = 0; i < rouExerVoList.size(); i++) {
				pstmt.setString(5+i*7, rouExerVoList.get(i).getExerciseName());      // 운동이름 notnull
				pstmt.setInt(6+i*7, rouExerVoList.get(i).getRoutineExerciseDay());  // 운동요일 notnull
				pstmt.setInt(7+i*7, rouExerVoList.get(i).getRoutineWeek());  // 루틴수행주차
//				pstmt.setInt(8+i*6, rouExerVoList.get(i).getRoutineDay());   //  루틴수행n번째일 지금만 막아놈
				pstmt.setInt(8+i*7, rouExerVoList.get(i).getRoutineExerciseSet());   // 루틴운동 세트수
				pstmt.setInt(9+i*7, rouExerVoList.get(i).getRoutineExerciseRepeat());  // 루틴운동 반복횟수
				pstmt.setInt(10+i*7, rouExerVoList.get(i).getRoutineExerciseWeight());  // 루틴무게
//				pstmt.setInt(12+i, rouExerVoList.get(i).getRoutineExerciseTime());  // null
//				pstmt.setInt(13+i, rouExerVoList.get(i).getRoutineExerciseDistance());  // null
				pstmt.setInt(11+i*7, rouExerVoList.get(i).getRoutineExerciseSequence());  
			}
			result = pstmt.executeUpdate();
			System.out.println("제바류ㅠ");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			System.out.println("finally제바류ㅠ");
		}
		System.out.println(result);
		return result;
		
	}
	
	
	public Map<String, Object> myRoutineReadAll(Connection conn, MemberVo mvo){
		ArrayList<RoutineVo> rvolist = null;
		ArrayList<RoutineExerciseVo> revolist = null;
		ArrayList<ExerciseVo> evolist = null;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String sql = "select tr.*,tre.*, te.exercise_name, te.exercise_Part "
				+ "				    from tb_routine tr, tb_member tm, tb_routine_exercise tre, tb_exercise te "
				+ "				    where tr.member_no = tm.member_no "
				+ "				    and tr.routine_no = tre.routine_no "
				+ "					   and tre.exercise_no = te.exercise_no "
				+ "						and tr.routine_disable = 'F' "
				+ "					   and tm.member_no = ? "
				+ "                       order by tr.routine_no desc, tre.routine_week asc,  "
				+ "						tre.routine_exercise_day asc, ROUTINE_EXERCISE_SEQUENCE asc, tre.routine_exercise_set asc";
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, mvo.getMemberNo());
				
				rs = pstmt.executeQuery();
				if(rs != null) {
					rvolist = new ArrayList<RoutineVo>();
					revolist = new ArrayList<RoutineExerciseVo>();
					evolist = new ArrayList<ExerciseVo>();
					while(rs.next()) {
						RoutineVo rvo = new RoutineVo();
						RoutineExerciseVo revo = new RoutineExerciseVo();
						ExerciseVo evo = new ExerciseVo();
						
						rvo.setRoutineNo(rs.getInt("ROUTINE_NO"));
						rvo.setMemberNo(rs.getInt("MEMBER_NO"));
						rvo.setRoutineName(rs.getString("ROUTINE_NAME"));
						rvo.setRoutineDisable(rs.getString("ROUTINE_DISABLE"));
						rvo.setRoutineTarget(rs.getString("ROUTINE_TARGET"));
						rvo.setRoutineContent(rs.getString("ROUTINE_CONTENT"));
						rvo.setRoutineSetRestTime(rs.getInt("ROUTINE_SET_REST_TIME"));
						rvo.setRoutineExerciseRestTime(rs.getInt("ROUTINE_EXERCISE_REST_TIME"));
						
						revo.setRoutineExerciseNo(rs.getInt("ROUTINE_EXERCISE_NO"));
						revo.setExerciseNo(rs.getInt("EXERCISE_NO"));
						revo.setRoutineExerciseDay(rs.getInt("ROUTINE_EXERCISE_DAY"));
						revo.setRoutineWeek(rs.getInt("ROUTINE_WEEK"));
						revo.setRoutineDay(rs.getInt("ROUTINE_DAY"));
						revo.setRoutineExerciseSet(rs.getInt("ROUTINE_EXERCISE_SET"));
						revo.setRoutineExerciseRepeat(rs.getInt("ROUTINE_EXERCISE_REPEAT"));
						revo.setRoutineExerciseWeight(rs.getInt("ROUTINE_EXERCISE_WEIGHT"));
						revo.setRoutineExerciseCopy(rs.getString("ROUTINE_EXERCISE_COPY"));
						
						evo.setExerciseName(rs.getString("EXERCISE_NAME"));
						evo.setExerciseNo(rs.getInt("EXERCISE_NO"));
						evo.setExercisePart(rs.getString("EXERCISE_PART"));
						
						
						rvolist.add(rvo);
						revolist.add(revo);
						evolist.add(evo);
					}
					
					resultMap.put("rvolist", rvolist);
					resultMap.put("revolist", revolist);
					resultMap.put("evolist", evolist);
					//ArrayList<RoutineVo> test = (ArrayList<RoutineVo>)resultMap.get("rvolist");
				}
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return resultMap;
		}
	
	
	public int MyRoutineDelete(Connection conn, RoutineVo rvo) {
		int result = 0;
		
		String sql="update tb_routine set routine_disable = 'T'  where routine_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvo.getRoutineNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
}



