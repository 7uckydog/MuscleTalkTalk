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
	
	public int insertReservation(Connection conn, int ptCalendarNo, int memberNo) {
		System.out.println("ptCalendarNo: " + ptCalendarNo + "변경함");
		int result = 0;
		String sql = "update tb_pt_calendar set PT_CALENDAR_RESERVATION_STATE = 'T',  "
				+ "member_no = ? "
				+ "where pt_calendar_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, ptCalendarNo);
			
			result = pstmt.executeUpdate();
			System.out.println("dao result : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<PtCalendarVo> readMyStudent(Connection conn, int trainerNo) {
		ArrayList<PtCalendarVo> ptCalList = new ArrayList<PtCalendarVo>();
		PtCalendarVo ptCalVo = null;
		String sql = "select tp.pt_name, tpc.pt_calendar_start_time, tm.member_name, tpc.pt_no, tm.member_no, tm.member_id  "
				+ "	    from tb_pt_calendar tpc  "
				+ "	    join tb_pt tp  "
				+ "	    on tpc.pt_no = tp.pt_no  "
				+ "	    join tb_member tm  "
				+ "	    on tpc.member_no = tm.member_no  "
				+ "	    where pt_calendar_reservation_state = 'T'  "
				+ "	        and tpc.pt_no in (select pt_no from tb_pt where trainer_no = ?)  ";

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainerNo);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ptCalVo = new PtCalendarVo();
				ptCalVo.setPtName(rs.getString("PT_NAME"));
				ptCalVo.setPtCalendarStartTime(rs.getTimestamp("PT_CALENDAR_START_TIME"));
				ptCalVo.setMemberName(rs.getString("MEMBER_NAME"));
				ptCalVo.setPtNo(rs.getInt("PT_NO"));
				ptCalVo.setMemberNo(rs.getInt("MEMBER_NO"));
				ptCalVo.setMemberId(rs.getString("MEMBER_ID"));
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
