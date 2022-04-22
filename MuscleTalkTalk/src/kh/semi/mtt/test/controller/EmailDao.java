package kh.semi.mtt.test.controller;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import kh.semi.mtt.member.model.vo.EmailVo;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

public class EmailDao {
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	// mail 테이블에 난수 insert
	public int insertNumber(Connection conn, String emailCertificationEmail) {
		System.out.println("dao :" + emailCertificationEmail);
		int result = 0;
		
		String sql = "insert into tb_email_certification (email_certification_no, email_certification_email, email_certification_code) values((select nvl(max(email_certification_no),0)+1 from tb_email_certification), ?, (select round(dbms_random.value()*1000000)+1 as RandomNum from dual))";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, emailCertificationEmail);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
