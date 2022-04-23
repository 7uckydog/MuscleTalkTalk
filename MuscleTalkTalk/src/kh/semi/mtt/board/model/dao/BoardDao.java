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
	
	
	
	public int insertBoard(Connection conn, BoardVo vo) {
//		String m_nickname = "aaa";
		int memberNo = 13;
		int board_count = 20;
		int result = 0;
//		BOARD_NO          NOT NULL NUMBER         
//		MEMBER_NO         NOT NULL NUMBER         
//		BOARD_TITLE       NOT NULL VARCHAR2(200)  
//		BOARD_CONTENT     NOT NULL VARCHAR2(1000) 
//		BOARD_COUNT       NOT NULL NUMBER         
//		BOARD_DATE        NOT NULL DATE           
//		BOARD_CATEGORY_NO NOT NULL NUMBER(1)  
//		String sql = "insert into tb_board values((SELECT nvl(max(BOARD_NO),0)+1 from TB_board),(select member_no from tb_member where member_no = '" + memberNo + "'),"  
//				+ vo.getBoardTitle() + "','" 
//				+ vo.getBoardContent() + "','" 
//				+ board_count +"','" + "sysdate , default)";
		String sql = "insert into tb_board (board_no, MEMBER_NO, BOARD_TITLE, BOARD_CONTENT, BOARD_COUNT, BOARD_DATE, BOARD_CATEGORY_NO) "
				+ "values ((SELECT nvl(max(BOARD_NO),0)+1 from TB_board), "+memberNo+", '"+ vo.getBoardTitle() +"', '"+vo.getBoardContent()+"', "+board_count+", default, default)";
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result; 
	}
		
	public BoardVo readBoard(Connection conn, int boardNo) {
		BoardVo vo = null;
		String sql = "select b.BOARD_NO, m.MEMBER_nickname, b.BOARD_TITLE, b.BOARD_CONTENT, b.BOARD_COUNT, b.BOARD_DATE "
				   +" from tb_board b , tb_member m "
				   +" WHERE b.MEMBER_NO = m.MEMBER_NO AND BOARD_NO=? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			vo = new BoardVo();
			if(rs.next()) {
				vo.setBoardNo(rs.getInt("BOARD_NO"));
				vo.setBoardTitle(rs.getString("BOARD_TITLE"));
				vo.setMemberNickname(rs.getString("MEMBER_NICKNAME"));
				vo.setBoardContent(rs.getString("BOARD_CONTENT"));
				vo.setBoardCount(rs.getInt("BOARD_COUNT"));
				vo.setBoardDate(rs.getDate("BOARD_DATE"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return vo;
		
	}
	
	
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
				+ " where r between ? and ?"
				+ " order by r";
		
		
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
