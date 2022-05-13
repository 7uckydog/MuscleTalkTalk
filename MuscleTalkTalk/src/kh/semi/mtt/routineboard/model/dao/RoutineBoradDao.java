package kh.semi.mtt.routineboard.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;
import kh.semi.mtt.routineboard.model.vo.RoutineBoardVo;

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
	
	public RoutineBoardVo readRoutineBoard(Connection conn, int routineboardNo) {
		RoutineBoardVo rvo = null;
		
		String sql = "select R, routine_board_no, member_nickname, routine_board_title, routine_board_content, routine_board_count, routine_board_date, board_category_no, r_cnt from "
				+ "				(select rownum r, t1.* from (select b1.*,(select count(*) from "
				+ "				tb_comment r1 where r1.board_no = b1.routine_board_no) r_cnt "
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
