package kh.semi.mtt.reservation.model.service;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.mtt.reservation.model.dao.ReservationDao;
import kh.semi.mtt.reservation.model.vo.ReservationVo;

public class ReservationService {
	public int countReservation_member(int memberNo) {
		int result = -1;
		Connection conn = null;
		conn = getConnection();
		
		result = new ReservationDao().countReservation_member(conn, memberNo);
		close(conn);
		return result;
	}
	
	public ArrayList<ReservationVo> readOneMemberReservation(int startRnum, int endRnum, int memberNo){
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<ReservationVo> volist= new ReservationDao().readOneMemberReservation(conn, startRnum, endRnum, memberNo);
		close(conn);
		return volist;
	}
	public int cancelReservation(int ptCalendarNo, int memberNo) {
		int result = -1;
		Connection conn = null;
		conn = getConnection();
		
		result = new ReservationDao().cancelReservation(conn, ptCalendarNo, memberNo);
		close(conn);
		return result;
	}
	public int cancelReservation2(int memberNo) {
		int result = -1;
		Connection conn = null;
		conn = getConnection();
		
		result = new ReservationDao().cancelReservation2(conn, memberNo);
		close(conn);
		return result;
	}
}
