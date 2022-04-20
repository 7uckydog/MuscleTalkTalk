package kh.semi.mtt.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;
import kh.semi.mtt.notice.model.vo.NoticeVo;

public class NoticeDao {
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public int insertNotice(Connection conn, NoticeVo vo) {
		
		int result = 0;
//		INSERT INTO TB_NOTICE (
//		        NOTICE_NO, MEMBER_NO, 
//		        NOTICE_TITLE, NOTICE_CONTENT, NOTICE_COUNT, NOTICE_DATE) 
//		    VALUES (
//		        (SELECT nvl(max(NOTICE_NO),0)+1 from TB_NOTICE), 1,
//		        '테스트 공지사항 제목', '테스트 공지사항 내용', DEFAULT, SYSDATE
//		    );
//		String sql = "insert into board values (SEQ_B_NO.nextval, '" + vo.getbTitle() + "', '" + vo.getbContent()
//		+ "', (select m_nickname from member where m_id='" + mId + "') ,default, default, '" + mId + "', '"+vo.getbFilePath()+"') ";
		String sql = "insert into tb_notice values ( (SELECT nvl(max(NOTICE_NO),0)+1 from TB_NOTICE), '" 
				+ vo.getMemberNo() + "', '"+vo.getNotiTitle()+"', '"+vo.getNotiContent()+"', default, '"+vo.getNotiDate()+"')";
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
		
	}
}
