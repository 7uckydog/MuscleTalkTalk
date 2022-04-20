package kh.semi.mtt.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import kh.semi.mtt.notice.model.vo.NoticeVo;

public class NoticeDao {
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public int insertNotice(Connection conn, NoticeVo vo) {
		int memberNo = 1;
		int result = 0;

		String sql = "insert into tb_notice values ( (SELECT nvl(max(NOTICE_NO),0)+1 from TB_NOTICE), '" 
				+ memberNo + "', '"+vo.getNotiTitle()+"', '"+vo.getNotiContent()+"', default, sysdate)";
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
	
	public ArrayList<NoticeVo> listNotice(Connection conn, int startNnum, int endNnum){
		ArrayList<NoticeVo> volist = null;
		String sql = "select notice_no, notice_title, notice_date from tb_notice order by notice_no desc"
				+ "where notice_no between? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNnum);
			pstmt.setInt(2, endNnum);
			rs = pstmt.executeQuery();
			
			if (rs != null) { // SQLException 외 예외상황
				volist = new ArrayList<NoticeVo>();
				while (rs.next()) {
					NoticeVo vo = new NoticeVo();
					vo.setNoticeNo(rs.getInt("noticeNo"));
					vo.setNotiTitle(rs.getString("notiTitle"));
					vo.setNotiDate(rs.getTimestamp("notiDate"));
					vo.setNotiContent(rs.getString("notiContent"));
					
					
					volist.add(vo);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return volist;
		
	}

	public int countNotice(Connection conn) {
		int result = 0;
		String sql = "select count(*) count from tb_notice";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt("count"); // 별칭 없이 1 이라고해도됨(1번컬럼)
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
	}
}
