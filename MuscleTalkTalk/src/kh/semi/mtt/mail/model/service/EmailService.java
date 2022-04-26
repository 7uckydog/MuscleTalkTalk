package kh.semi.mtt.mail.model.service;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import java.sql.Connection;

import kh.semi.mtt.common.jdbc.JdbcTemplate;
import kh.semi.mtt.mail.model.dao.EmailDao;
import kh.semi.mtt.member.model.vo.EmailVo;

public class EmailService {
	
	// mail 테이블에 난수 insert
	public int insertNumber(String emailCertificationEmail) {
		Connection conn = null;
		conn = getConnection();
		
		int result = new EmailDao().insertNumber(conn, emailCertificationEmail);
		System.out.println("Email service :" + result);
		close(conn);
		return result;
	}
	
	// email 주소로 해당하는 난수 찾기 (메일 보내기용) 
	public EmailVo findRandomNumber(String emailCertificationEmail) {
		Connection conn = null;
		conn = getConnection();
		
		EmailVo evo = new EmailDao().findRandomNumber(conn, emailCertificationEmail);
		System.out.println("findRandomNumber: evo:" + evo);
		close(conn);
		return evo;
	}
	
	// email 주소와 code가 일치하는지 확인하기 (메일 인증용) 
	public EmailVo checkEmailAndCode(String emailCertificationCode, String emailCertificationEmail) {
		Connection conn = null;
		conn = getConnection();
		
		System.out.println("코드 일치하는지 확인 서비스");
		System.out.println("checkEmailAndCode에서 emailCertificationCode: " + emailCertificationCode);	
		System.out.println("checkEmailAndCode에서 emailCertificationEmail: " + emailCertificationEmail);	
		EmailVo evo = new EmailDao().checkEmailAndCode(conn, emailCertificationCode, emailCertificationEmail);
		close(conn);
		return evo;
	}
	
	// 이메일 테이블에 정보 삭제하기 (인증 완료 후)
	public int deleteTableInfo(String emailCertificationCode, String emailCertificationEmail) {
		Connection conn = null;
		conn = getConnection();
		
		System.out.println("테이블 정보 삭제 서비스");
		int result = new EmailDao().deleteTableInfo(conn, emailCertificationCode, emailCertificationEmail);
		close(conn);
		return result;
	}
	
	// 이메일 테이블에 정보 삭제하기 (인증 완료 전)
		public int deleteTableInfo2(String emailCertificationEmail) {
			Connection conn = null;
			conn = getConnection();
			
			int result = new EmailDao().deleteTableInfo2(conn, emailCertificationEmail);
			System.out.println("emailservice: " + result);
			close(conn);
			return result;
		}
		
}
