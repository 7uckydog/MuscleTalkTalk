package kh.semi.mtt.mail.model.dao;


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
	
	// email 주소로 해당하는 난수 찾기 (메일 보내기용) 
	public EmailVo findRandomNumber(Connection conn, String emailCertificationEmail) {
		EmailVo evo = null;
		String sql = "select email_certification_code from tb_email_certification where email_certification_email = ?";
		System.out.println("이메일이 잘못 됬다??" + emailCertificationEmail);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, emailCertificationEmail);
			rs = pstmt.executeQuery();
			if(rs!=null) {
				if(rs.next()) {
					evo = new EmailVo();
					evo.setEmailCertificationCode(rs.getString("email_certification_code"));
					System.out.println("두근두근 가져온 값음????:"+rs.getString("email_certification_code"));
				}
			}

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return evo;
	}
	
	// email 주소와 code가 일치하는지 확인하기 (메일 인증용) 
	public EmailVo checkEmailAndCode(Connection conn, String emailCertificationCode, String emailCertificationEmail) {
		EmailVo evo = null;
		String sql = "select * from tb_email_certification where email_certification_code = ? and email_certification_email = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, emailCertificationCode);
			pstmt.setString(2, emailCertificationEmail);
			System.out.println("코드 일치하는지 확인 디에이오");
			rs = pstmt.executeQuery();
			if(rs!=null) {
				if(rs.next()) {
					evo = new EmailVo();
					evo.setEmailCertificationCode(rs.getString("email_certification_code"));
					evo.setEmailCertificationEmail(rs.getString("email_certification_email"));
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return evo;
	}
	
	// 이메일 테이블에 정보 삭제하기 (인증 완료 후)
	public int deleteTableInfo(Connection conn, String emailCertificationCode, String emailCertificationEmail) {
		int result = 0;
		
		String sql = "delete from tb_email_certification where email_certification_code = ? and email_certification_email = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, emailCertificationCode);
			pstmt.setString(2, emailCertificationEmail);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("회원정보 삭제 성공~");
		return result;
	}
	
	// 이메일 테이블에 정보 삭제하기 (인증 완료 전)
		public int deleteTableInfo2(Connection conn, String emailCertificationEmail) {
			int result = 0;
			
			String sql = "delete from tb_email_certification where email_certification_email = ?";
			
			try {
				System.out.println(emailCertificationEmail);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, emailCertificationEmail);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			System.out.println("인증 전, 회원정보 삭제 성공~");
			System.out.println(result);
			return result;
		}
}
