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
	
	public ArrayList<PtCalendarVo> readMyStudent(Connection conn, int trainerNo, int startRnum, int endRnum) {
		ArrayList<PtCalendarVo> ptCalList = new ArrayList<PtCalendarVo>();
		PtCalendarVo ptCalVo = null;
		String sql = "select *"
				+ "    from ("
				+ "    select rownum r, t1.*"
				+ "    from (select tp.pt_name, tpc.pt_calendar_start_time, tm.member_name, tpc.pt_no, tm.member_no, tm.member_id  "
				+ "            	    from tb_pt_calendar tpc  "
				+ "            	    join tb_pt tp  "
				+ "            	    on tpc.pt_no = tp.pt_no  "
				+ "            	    join tb_member tm  "
				+ "            	    on tpc.member_no = tm.member_no  "
				+ "            	    where pt_calendar_reservation_state = 'T'  "
				+ "            	        and tpc.pt_no in (select pt_no from tb_pt where trainer_no = ?) "
				+ "                        and tpc.pt_calendar_start_time > systimestamp "
				+ "                    order by pt_calendar_start_time asc) t1) "
				+ "                    where r between ? and ?  ";

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainerNo);
			pstmt.setInt(2, startRnum);
			pstmt.setInt(3, endRnum);
			
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
	
	public int countReservation(Connection conn, int trainerNo) {
		int result = 0;
		String sql = "select count(pt_calendar_no) "
				+ "    from tb_pt_calendar tpc "
				+ "    join tb_pt tp "
				+ "    on tpc.pt_no = tp.pt_no "
				+ "    where trainer_no =? and tpc.pt_calendar_reservation_state = 'T'"
				+ "    and pt_calendar_start_time > systimestamp";

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainerNo);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int reviewReservation(Connection conn, int memberNo, int ptNo) {
		int result = 0;
		String sql = "select count(pt_calendar_no)  "
				+ "from tb_pt_calendar  "
				+ "where member_no = ? and pt_no = ?";

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, ptNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int updatePrevReservation(Connection conn, int prevPtCalendarNo) {
		int result = 0;
		String sql = "update tb_pt_calendar   "
				+ "set member_no = null,   "
				+ "pt_calendar_reservation_state = 'F'   "
				+ "where pt_calendar_no = ?  ";

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prevPtCalendarNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public ArrayList<PtCalendarVo> readMyReservation(Connection conn, int memberNo) {
		ArrayList<PtCalendarVo> ptCalList = new ArrayList<PtCalendarVo>();
		PtCalendarVo ptCalVo = null;
		String sql = "select pt_calendar_no, tpc.pt_no, member_no, "
				+ "    pt_calendar_start_time, pt_calendar_reservation_state, pt_name "
				+ "    from tb_pt_calendar tpc "
				+ "    join tb_pt tp "
				+ "    on tpc.pt_no = tp.pt_no "
				+ "    where member_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ptCalVo = new PtCalendarVo();
				ptCalVo.setPtCalendarNo(rs.getInt("PT_CALENDAR_NO"));
				ptCalVo.setPtNo(rs.getInt("PT_NO"));
				ptCalVo.setMemberNo(rs.getInt("member_no"));
				ptCalVo.setPtName(rs.getString("pt_name"));
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
	
	public PtCalendarVo readOneReservation(Connection conn, int ptCalendarNo) {
		PtCalendarVo result = new PtCalendarVo();
		String sql = "select tm.member_name, tpc.pt_calendar_start_time, tp.pt_name, "
				+ "                    tt.gym_name, tt.gym_location, tp.pt_price"
				+ "				    from tb_pt_calendar tpc "
				+ "				    join tb_pt tp "
				+ "				    on tpc.pt_no = tp.pt_no "
				+ "                    join tb_member tm "
				+ "                    on tpc.member_no = tm.member_no "
				+ "                    join tb_trainer tt "
				+ "                    on tp.trainer_no = tt.trainer_no "
				+ "				    where  pt_calendar_no= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ptCalendarNo);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = new PtCalendarVo();
				result.setMemberName(rs.getString("member_name"));
				result.setPtName(rs.getString("pt_name"));
				result.setGymName(rs.getString("gym_name"));
				result.setGymLocation(rs.getString("gym_location"));
				result.setPtCalendarStartTime(rs.getTimestamp("pt_calendar_start_time"));
				result.setPtPrice(rs.getInt("pt_price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
}
