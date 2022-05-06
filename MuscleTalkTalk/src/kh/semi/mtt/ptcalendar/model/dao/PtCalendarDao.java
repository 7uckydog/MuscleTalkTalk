package kh.semi.mtt.ptcalendar.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kh.semi.mtt.ptcalendar.model.vo.PtCalendarVo;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

public class PtCalendarDao {
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private CallableStatement cstmt = null;
	
	public ArrayList<PtCalendarVo> readAllReservation(Connection conn, int ptNo) {
		ArrayList<PtCalendarVo> ptCalList = new ArrayList<PtCalendarVo>();
		PtCalendarVo ptCalVo = null;
		String sql = "select pt_calendar_no, pt_no, "
				+ "pt_calendar_start_time, "
				+ "pt_calendar_reservation_state "
				+ "from tb_pt_calendar where pt_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ptNo);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ptCalVo = new PtCalendarVo();
				ptCalVo.setPtCalendarNo(rs.getInt("PT_CALENDAR_NO"));
				ptCalVo.setPtNo(rs.getInt("PT_NO"));
				ptCalVo.setPtCalendarStartTime(rs.getTimestamp("PT_CALENDAR_START_TIME"));
				ptCalVo.setPtCalendarReservationState(rs.getString("PT_CALENDAR_RESERVATION_STATE"));
				ptCalList.add(ptCalVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(rs);
			close(pstmt);
		}
		return ptCalList;
	}
}
