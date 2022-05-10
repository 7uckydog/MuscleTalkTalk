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
	
	public ArrayList<BlackistVo> readBlacklist(Connection conn, int trainerNo, int startRnum, int endRnum) {
		ArrayList<BlackistVo> result = new ArrayList<BlackistVo>();
		String sql = "select *"
				+ "    from ("
				+ "    select rownum r, t1.*"
				+ "    from ("
				+ "    select BLACK_LIST_NO, TRAINER_NO, TB.MEMBER_NO, BLACKLIST_DATE, TM.MEMBER_NAME "
				+ "				    FROM TB_BLACKLIST TB  "
				+ "				    JOIN TB_MEMBER TM  "
				+ "				    ON TB.MEMBER_NO = TM.MEMBER_NO  "
				+ "				    WHERE TRAINER_NO = ?) t1 )"
				+ "    where r between ? and ?  ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainerNo);
			pstmt.setInt(2, startRnum);
			pstmt.setInt(3, endRnum);
			
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
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int readOneBlacklist(Connection conn, int trainerNo, int memberNo) {
		int result = -1;
		String sql = "select count(black_list_no) "
				+ "from tb_blacklist "
				+ "where trainer_no = ? and member_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainerNo);
			pstmt.setInt(2, memberNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {

				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
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
	
	public int countBlacklist(Connection conn, int trainerNo) {
		int result = 0;
		String sql = "select count(BLACK_LIST_NO) from tb_blacklist  "
				+ "where trainer_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainerNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Integer> blacklistMember(Connection conn, int ptNo) {
		ArrayList<Integer> result = new ArrayList<Integer>();
		String sql = "select member_no "
				+ "    from tb_blacklist tb"
				+ "    join (select trainer_no from tb_pt where pt_no = ?) TBa"
				+ "    on tb.trainer_no = TBa.trainer_no";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ptNo);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result.add(rs.getInt(1));
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
