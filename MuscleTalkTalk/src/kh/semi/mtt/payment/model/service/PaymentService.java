package kh.semi.mtt.payment.model.service;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;
import static kh.semi.mtt.common.jdbc.JdbcTemplate.getConnection;

import java.sql.Connection;

import kh.semi.mtt.payment.model.dao.PaymentDao;

public class PaymentService {
	private PaymentDao dao = new PaymentDao();
	
	public int insertPayment(int memberNo, int ptPrice, int ptCalendarNo) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.insertPayment(conn, memberNo, ptPrice, ptCalendarNo);
		
		close(conn);
		return result;
	}
}
