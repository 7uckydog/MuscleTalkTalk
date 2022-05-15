package kh.semi.mtt.routineboard.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.exercise.model.vo.ExerciseVo;
import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.routine.model.vo.RoutineVo;
import kh.semi.mtt.routineboard.model.vo.RoutineBoardVo;
import kh.semi.mtt.routineexercise.model.vo.RoutineExerciseVo;

public class RoutineBoradDao {
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<RoutineBoardVo> readAllRoutineBoard(Connection conn, int startRnum, int endRnum) {
		ArrayList<RoutineBoardVo> rvolist = null;
		
		String sql ="select R, ROUTINE_BOARD_NO, member_nickname, ROUTINE_BOARD_TITLE, ROUTINE_BOARD_CONTENT, ROUTINE_BOARD_COUNT, ROUTINE_BOARD_DATE, board_category_no, r_cnt from "
				+ "	(select rownum r, t1.* from (select b1.*,(select count(*) from "
				+ "	tb_comment r1 where r1.ROUTINE_BOARD_NO = b1.ROUTINE_BOARD_NO) r_cnt "
				+ "	from tb_routine_board b1 order by ROUTINE_BOARD_NO desc) t1)tba join tb_member tbm on tba.member_no = tbm.member_no "
				+ "	where r between ? and ?"
				+ "	order by ROUTINE_BOARD_DATE desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
			
			
			rs = pstmt.executeQuery();
			if(rs !=null) {
				rvolist = new ArrayList<RoutineBoardVo>();
				while(rs.next()) {
					RoutineBoardVo rvo = new RoutineBoardVo();
					rvo.setRoutineboardNo(rs.getInt("ROUTINE_BOARD_NO"));
					rvo.setRoutineboardDate(rs.getDate("ROUTINE_BOARD_DATE"));
					rvo.setRoutineboardTitle(rs.getString("ROUTINE_BOARD_TITLE"));
					rvo.setRoutineboardContent(rs.getString("ROUTINE_BOARD_CONTENT"));
					rvo.setRoutineboardCount(rs.getInt("ROUTINE_BOARD_COUNT"));
					rvo.setMemberNickname(rs.getString("MEMBER_NICKNAME"));
					rvo.setBoardCategoryNumber(rs.getInt("BOARD_CATEGORY_NO"));
					rvo.setrCnt(rs.getInt("R_CNT"));
					
					rvolist.add(rvo);
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return rvolist;
		
	}
	
	public ArrayList<RoutineBoardVo> mainRoutineBoard(Connection conn) {
		ArrayList<RoutineBoardVo> rvolist = null;
		
		String sql ="select * "
				+ "   from (select rownum r, t1.* "
				+ "   from (select tb.routine_board_no, routine_board_title, tbcnt.comment_cnt "
				+ "   from tb_routine_board tb "
				+ "   left outer join (select count(comment_no) comment_cnt, routine_board_no from tb_comment "
				+ "   where routine_board_no is not null "
				+ "   group by routine_board_no) tbcnt "
				+ "   on tb.routine_board_no = tbcnt.routine_board_no "
				+ "   where routine_board_date "
				+ "   between sysdate - 1 and sysdate "
				+ "   order by routine_board_count desc) t1) "
				+ "   where r between 1 and 10";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			if(rs !=null) {
				rvolist = new ArrayList<RoutineBoardVo>();
				while(rs.next()) {
					RoutineBoardVo rvo = new RoutineBoardVo();
					rvo.setRoutineboardNo(rs.getInt("ROUTINE_BOARD_NO"));
					rvo.setRoutineboardTitle(rs.getString("ROUTINE_BOARD_TITLE"));
					rvo.setrCnt(rs.getInt("comment_cnt"));
					
					rvolist.add(rvo);
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return rvolist;
		
	}
	
	
	public int insertRoutineboard (Connection conn, RoutineBoardVo rvo, MemberVo mvo) {
		
		int result = 0;
		int routineboard_count = 0;
		
		String sql = "INSERT INTO TB_ROUTINE_BOARD ("
				+ "        ROUTINE_BOARD_NO, MEMBER_NO, "
				+ "        ROUTINE_NO, ROUTINE_BOARD_TITLE, ROUTINE_BOARD_CONTENT, ROUTINE_BOARD_COUNT, "
				+ "        ROUTINE_BOARD_DATE,ROUTINE_BOARD_SHARE, BOARD_CATEGORY_NO)"
				+ "    VALUES ("
				+ "        (SELECT nvl(max(routine_board_no),0)+1 from tb_routine_board), ?,"
				+ "        ?, ?, ?, "+routineboard_count+" ,"
				+ "        DEFAULT, DEFAULT, DEFAULT"
				+ "    ) ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvo.getMemberNo());
			pstmt.setInt(2, rvo.getRoutineNo());
			pstmt.setString(3, rvo.getRoutineboardTitle());
			pstmt.setString(4, rvo.getRoutineboardContent());
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
		
	}
	public int routineBoardViewCount(Connection conn ,RoutineBoardVo rvo) {
		String sql = "update tb_routine_board set routine_board_count = routine_board_count+1 where routine_board_no=?";
		
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvo.getRoutineboardNo());
			result = pstmt.executeUpdate();
			
			System.out.println("조회수 1증가");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(conn);
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	public RoutineBoardVo readRoutineBoard(Connection conn, int routineboardNo) {
		RoutineBoardVo rvo = null;
		
		String sql = "select R, routine_board_no, member_nickname, routine_board_title, routine_board_content, routine_board_count, routine_board_date, board_category_no, r_cnt from "
				+ "				(select rownum r, t1.* from (select b1.*,(select count(*) from "
				+ "				tb_comment r1 where r1.routine_board_no = b1.routine_board_no) r_cnt "
				+ "				from tb_routine_board b1 order by routine_board_no desc) t1)tba join tb_member tbm on tba.member_no = tbm.member_no "
				+ "				where routine_board_no=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, routineboardNo);
			rs = pstmt.executeQuery();
			
			rvo = new RoutineBoardVo();
			
			if(rs.next()) {
				rvo.setRoutineboardNo(rs.getInt("routine_board_no"));
				rvo.setRoutineboardTitle(rs.getString("routine_BOARD_TITLE"));
				rvo.setMemberNickname(rs.getString("MEMBER_NICKNAME"));
				rvo.setRoutineboardContent(rs.getString("routine_BOARD_CONTENT"));
				rvo.setRoutineboardCount(rs.getInt("routine_board_count"));
				rvo.setRoutineboardDate(rs.getDate("routine_board_date"));
				rvo.setrCnt(rs.getInt("R_CNT"));
				
				System.out.println("루틴보드rs에 담긴 값");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return rvo;
	}
	
	public Map<String, Object> readRoutineBoardRouintenInformation(Connection conn, int routineboardNo) {
		
		ArrayList<RoutineVo> rvolist = null;
		ArrayList<RoutineExerciseVo> revolist = null;
		ArrayList<ExerciseVo> evolist = null;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String sql = "    select tr.*,tre.*, te.exercise_name , te.exercise_Part , tm.* "
				+ "		from tb_routine tr, tb_routine_board tm, tb_routine_exercise tre, tb_exercise te "
				+ "		where tr.routine_no = tm.routine_no "
				+ "		and tr.routine_no = tre.routine_no "
				+ "		and tre.exercise_no = te.exercise_no"
				+ "     and tm.routine_board_no = ?"
				+ "		order by tr.routine_no desc, tre.routine_week asc,  "
				+ "		tre.routine_exercise_day asc, ROUTINE_EXERCISE_SEQUENCE asc, tre.routine_exercise_set asc ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, routineboardNo);
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
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return resultMap;
		
	}
	
	
	
	
	
	
	
	public int countRoutineBoard(Connection conn) {
		int result = 0;
		String sql = "select count(*) as cnt from tb_routine_board";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			close(rs);
			close(pstmt);
		}

		return result;

	}
	
	
	
	
	
	
	
	
	
}
