package kh.semi.mtt.test.controller;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.getConnection;

import java.sql.Connection;

import kh.semi.mtt.member.model.vo.EmailVo;

public class EmailService {
	
	// mail 테이블에 난수 insert
	public int insertNumber(String emailCertificationEmail) {
		Connection conn = null;
		conn = getConnection();
		System.out.println("service :" + emailCertificationEmail);
		
		int result = new EmailDao().insertNumber(conn, emailCertificationEmail);
		System.out.println("service :" + result);
		return result;
	}
}
