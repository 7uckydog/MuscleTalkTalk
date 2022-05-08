package kh.semi.mtt.blacklist.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kh.semi.mtt.blacklist.model.vo.BlackistVo;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;

public class BlacklistDao {
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private CallableStatement cstmt = null;
	
	public int insertBlacklist(Connection conn, int trainerNo, int memberNo) {
		int result = 0;
		String sql = "insert into tb_blacklist "
				+ "(BLACK_LIST_NO, TRAINER_NO, MEMBER_NO, BLACKLIST_DATE) "
				+ "values "
				+ "((SELECT nvl(max(BLACK_LIST_NO),0)+1 from tb_blacklist), "
				+ "?, ?, DEFAULT) ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainerNo);
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<BlackistVo> readBlacklist(Connection conn, int trainerNo) {
		ArrayList<BlackistVo> result = new ArrayList<BlackistVo>();
		String sql = "select BLACK_LIST_NO, TRAINER_NO, TB.MEMBER_NO, BLACKLIST_DATE, TM.MEMBER_NAME "
				+ "    FROM TB_BLACKLIST TB  "
				+ "    JOIN TB_MEMBER TM  "
				+ "    ON TB.MEMBER_NO = TM.MEMBER_NO  "
				+ "    WHERE TRAINER_NO = ?  ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainerNo);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BlackistVo vo = new BlackistVo();
				vo.setBlacklistNo(rs.getInt("BLACK_LIST_NO"));
				vo.setTrainerNo(rs.getInt("TRAINER_NO"));
				vo.setMemberNo(rs.getInt("MEMBER_NO"));
				vo.setBlacklistDate(rs.getDate("BLACKLIST_DATE"));
				vo.setMemberName(rs.getString("MEMBER_NAME"));
				result.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	public int deleteBlacklist(Connection conn, int blacklistNo) {
		int result = 0;
		String sql = "delete from tb_blacklist  "
				+ "where BLACK_LIST_NO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, blacklistNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
