package kh.semi.mtt.report.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.report.model.vo.ReportVo;
import kh.semi.mtt.routineboard.model.vo.RoutineBoardVo;

public class ReportDao {
	
	
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	
	public int insertReport(Connection conn,ReportVo rpvo, MemberVo mvo){
			int result = 0;
			String sql = "";
			if(rpvo.getRoutineboardNo() == 0) {
				sql ="insert into TB_BOARD_REPORT(BOARD_REPORT_NO,BOARD_REPORT_CONTENT,BOARD_REPORT_TIME,MEMBER_NO,BOARD_NO,ROUTINE_BOARD_NO)"
						+ "  values( (select nvl(max(BOARD_REPORT_NO),0)+1 from TB_BOARD_REPORT), ?, systimestamp, ?, ?, null)";
			} else {
				
			}
			
			try {
				pstmt = conn.prepareStatement(sql);
				if(rpvo.getRoutineboardNo() == 0) {					
					pstmt.setString(1, rpvo.getBoardReportContent());
					pstmt.setInt(2, mvo.getMemberNo());
					pstmt.setInt(3, rpvo.getBoardNo());
				} else {
					
				}
//				pstmt.setInt(4, rvo.getRoutineNo());
				
				
				result = pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return result;
		
	}
}
