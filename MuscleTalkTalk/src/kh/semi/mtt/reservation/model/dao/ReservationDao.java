package kh.semi.mtt.reservation.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.reservation.model.vo.ReservationVo;

public class ReservationDao {
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	// 회원의 예약건수 카운트
	public int countReservation_member(Connection conn, int memberNo) {
		int result = 0;
		String sql = "select count(*) as cnt from tb_pt_calendar where member_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);	
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
	
	// 회원의 예약 리스트 조회
	public ArrayList<ReservationVo> readOneMemberReservation(Connection conn, int startRnum, int endRnum, int memberNo){
		ArrayList<ReservationVo> volist = null;
		String sql="select r, pt_no, pt_name, pt_calendar_start_time, pt_calendar_no"
				+ "				from (select t1.*, rownum r from"
				+ "				(select c.pt_no, c.pt_name, m.pt_calendar_start_time, m.pt_calendar_no from tb_pt c"
				+ "				join tb_pt_calendar m on c.pt_no = m.pt_no"
				+ "				where member_no = ? order by pt_calendar_start_time asc)t1"
				+ "             )t2"
				+ "				where r between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);	
			pstmt.setInt(2, startRnum);		
			pstmt.setInt(3, endRnum);

			rs = pstmt.executeQuery();
			if(rs != null) {
				volist = new ArrayList<ReservationVo>();
				while (rs.next()) {
					ReservationVo vo = new ReservationVo();
					vo.setrNo(rs.getInt("r"));
					vo.setPtNo(rs.getInt("pt_no"));
					vo.setPtName(rs.getString("pt_name"));
					vo.setPtCalendarStartTime(rs.getTimestamp("pt_calendar_start_time"));
					vo.setPtCalendarNo(rs.getInt("pt_calendar_no"));
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
	
	//예약 취소
	public int cancelReservation(Connection conn, int ptCalendarNo, int memberNo) {
		System.out.println("dao다 " + ptCalendarNo);
		int result = -1;
		String sql = "update tb_pt_calendar set pt_calendar_reservation_state = 'F', member_no = null where member_no = ? and pt_calendar_no = ?";
		String sql2 = "delete from tb_payment where pt_calendar_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, ptCalendarNo);
			result = pstmt.executeUpdate();
			close(pstmt);
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, ptCalendarNo);
			result = pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//회원 탈퇴용 예약 취소
		public int cancelReservation2(Connection conn, int memberNo) {
			int result = -1;
			String sql = "update tb_pt_calendar set pt_calendar_reservation_state = 'F', member_no = null where member_no = ?";
			String sql2 = "delete from tb_payment where member_no = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memberNo);
				result = pstmt.executeUpdate();
				System.out.println("sql1: " + result);
				close(pstmt);
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, memberNo);
				result = pstmt.executeUpdate();
				System.out.println("sql2: " + result);
			} catch(Exception e){
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
	
}
