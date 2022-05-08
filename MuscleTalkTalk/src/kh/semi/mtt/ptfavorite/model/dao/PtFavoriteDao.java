package kh.semi.mtt.ptfavorite.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kh.semi.mtt.ptfavorite.model.vo.PtFavoriteVo;

public class PtFavoriteDao {
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private CallableStatement cstmt = null;
	
	public int insertPtFavorite(Connection conn, int memberNo, int ptNo) {
		int result = 0;
		
		String sql = "insert into tb_pt_favorite "
				+ "(favorite_no, member_no, pt_no)  "
				+ "values  "
				+ "((SELECT nvl(max(favorite_no),0)+1 from tb_pt_favorite), ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, ptNo);

			
			result = pstmt.executeUpdate();
			System.out.println("dao result : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deletePtFavorite(Connection conn, int memberNo, int ptNo) {
		int result = 0;
		
		String sql = "delete from tb_pt_favorite "
				+ "where member_no = ? and pt_no =? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, ptNo);
			
			
			result = pstmt.executeUpdate();
			System.out.println("dao result : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<PtFavoriteVo> readAllPtFavorite(Connection conn, int memberNo) {
		System.out.println("memberNo : " + memberNo);
		ArrayList<PtFavoriteVo> result = new ArrayList<PtFavoriteVo>();
		
		String sql = "select favorite_no, member_no, pt_no  "
				+ "from tb_pt_favorite  "
				+ "where member_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PtFavoriteVo vo = new PtFavoriteVo();
				vo.setFavoriteNo(rs.getInt("favorite_no"));
				vo.setMemberNo(rs.getInt("member_no"));
				vo.setPtNo(rs.getInt("pt_no"));
				result.add(vo);
			}
			System.out.println("dao result : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(pstmt);
		}
		return result;
	}
}
