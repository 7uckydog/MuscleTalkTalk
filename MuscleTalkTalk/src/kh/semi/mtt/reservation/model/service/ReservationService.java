package kh.semi.mtt.reservation.model.service;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import java.sql.Connection;

import kh.semi.mtt.reservation.model.dao.ReservationDao;

public class ReservationService {
	public int countReservation_member(int memberNo) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		
		result = new ReservationDao().countReservation_member(conn, memberNo);
		close(conn);
		return result;
	}
}
