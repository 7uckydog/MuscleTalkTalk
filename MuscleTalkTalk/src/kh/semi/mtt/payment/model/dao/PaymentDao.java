package kh.semi.mtt.payment.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class PaymentDao {
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private CallableStatement cstmt = null;
	
	public int insertPayment(Connection conn, int memberNo, int ptPrice, int ptCalendarNo) {
		int result = 0;
		String sql = "insert into tb_payment "
				+ "(payment_no, member_no, payment_time, payment_price, pt_calendar_no)  "
				+ "values  "
				+ "((SELECT nvl(max(payment_no),0)+1 from tb_payment), ?, default, ?, ?)";

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, ptPrice);
			pstmt.setInt(3, ptCalendarNo);
			
			result = pstmt.executeUpdate();
			System.out.println("dao result : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(pstmt);
		}
		return result;
	}
}
