package kh.semi.mtt.board.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import kh.semi.mtt.board.model.vo.BoardVo;

public class BoardDao {
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	public ArrayList<BoardVo> readAllBoard(Connection conn, int startRnum, int endRnum){
		ArrayList<BoardVo> volist = null;
//		String sql = "select * from(select rownum r, t1.* from "
//		        + " (select b1.*,(select count(*) from tb_comment r1 where r1.board_no = b1.board_no) r_cnt " 
//		        + " from tb_board b1 order by board_no desc) t1)"
//		        + " where r between ? and ?";
		
		String sql = "select R, board_no, member_nickname, board_title, board_content, board_count, board_date, board_category_no, r_cnt from "
				+ " (select rownum r, t1.* from (select b1.*,(select count(*) from "
				+ " tb_comment r1 where r1.board_no = b1.board_no) r_cnt "
				+ " from tb_board b1 order by board_no desc) t1)tba join tb_member tbm on tba.member_no = tbm.member_no "
				+ " where r between ? and ?";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);		
			pstmt.setInt(2, endRnum);
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				volist = new ArrayList<BoardVo>();
				while (rs.next()) {
					BoardVo vo = new BoardVo();
					vo.setBoardNo(rs.getInt("BOARD_NO"));
					vo.setBoardDate(rs.getDate("BOARD_DATE"));
					vo.setBoardTitle(rs.getString("BOARD_TITLE"));
					vo.setBoardContent(rs.getString("BOARD_CONTENT"));
					vo.setBoardCount(rs.getInt("BOARD_COUNT"));
					vo.setMemberNickname(rs.getString("MEMBER_NICKNAME"));
					
					volist.add(vo);
					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			close(rs);
			close(pstmt);
		}
		
		
		return volist;
	}
	public int countBoard(Connection conn) {
		int result = 0;
		String sql = "select count(*) as cnt from tb_board";

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
