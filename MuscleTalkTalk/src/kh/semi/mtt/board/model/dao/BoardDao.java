package kh.semi.mtt.board.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		String sql = "select * from(select rownum r, t1.* from "
		        + " (select b1.*,(select count(*) from tb_comment r1 where r1.board_no = b1.board_no) r_cnt " 
		        + " from tb_board b1 order by board_no desc) t1)"
		        + " where r between ? and ?;";
//		BOARD_NO	NUMBER
//		MEMBER_NO	NUMBER
//		BOARD_TITLE	VARCHAR2(200 BYTE)
//		BOARD_CONTENT	VARCHAR2(1000 BYTE)
//		BOARD_COUNT	NUMBER
//		BOARD_DATE	DATE
//		BOARD_CATEGORY_NO	NUMBER(1,0)
//		private int boardNo;
//		private String boardTitle;
//		private String boardContent;
//		private int boardCount;
//		private Date boardDate;
//		private int boardType;
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
					vo.setBoardContent(rs.getString("BOARD_CONTENT"));
					
					
				}
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return volist;
	}
	
	
	
}
