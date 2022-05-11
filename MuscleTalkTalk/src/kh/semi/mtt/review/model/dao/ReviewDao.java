package kh.semi.mtt.review.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kh.semi.mtt.review.model.vo.ReviewVo;

public class ReviewDao {
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private CallableStatement cstmt = null;
	
	public int insertReview(Connection conn, ReviewVo vo) {
		int result = 0;
		String sql = "insert into "
				+ "tb_review "
				+ "(review_no, member_no, pt_no, review_content, review_regist_date) "
				+ "values "
				+ "((SELECT nvl(max(review_no),0)+1 from tb_review),"
				+ "? , ?, ?, default) ";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(2, vo.getPtNo());
			pstmt.setInt(1, vo.getMemberNo());
			pstmt.setString(3, vo.getReviewContent());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<ReviewVo> readReview(Connection conn, int ptNo) {
		ArrayList<ReviewVo> result = new ArrayList<ReviewVo>();
		String sql = "select tr.*, tm.member_nickname, tm.member_photo "
				+ "    from tb_review tr "
				+ "    join tb_member tm "
				+ "    on tr.member_no = tm.member_no "
				+ "    where tr.pt_no = ? ";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ptNo);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewVo vo = new ReviewVo();
				vo.setMemberNo(rs.getInt("member_no"));
				vo.setPtNo(rs.getInt("pt_no"));
				vo.setReviewNo(rs.getInt("review_no"));
				vo.setReviewContent(rs.getString("review_content").replace("\r\n","<br>"));
				vo.setMemberNickname(rs.getString("member_nickname"));
				vo.setMemberPhoto(rs.getString("member_photo"));
				vo.setReviewRegistDate(rs.getDate("review_regist_date"));
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
	
	public int updateReview(Connection conn, ReviewVo vo) {
		int result = 0;
		String sql = "update tb_review "
				+ "	set "
				+ " review_content = ? "
				+ " where review_no = ?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getReviewContent());
			pstmt.setInt(2, vo.getReviewNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ReviewVo readOneReview(Connection conn, ReviewVo vo) {
		ReviewVo result = null;
		String sql = "";
		if(vo.getReviewNo() == 0) {
			sql = "select * "
					+ "	from "
					+ " tb_review tr"
					+ " join tb_member tm"
					+ " on tr.member_no = tm.member_no"
					+ " where tr.member_no = ? and pt_no = ?";
					
		} else {
			sql = "select * "
					+ "	from "
					+ " tb_review tr"
					+ " join tb_member tm"
					+ " on tr.member_no = tm.member_no"
					+ " where review_no = ?";
		}

		try {
			
			pstmt = conn.prepareStatement(sql);
			if(vo.getReviewNo() == 0) {				
				pstmt.setInt(1, vo.getMemberNo());
				pstmt.setInt(2, vo.getPtNo());
			} else {				
				pstmt.setInt(1, vo.getReviewNo());
			}

			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = new ReviewVo();
				result.setMemberNo(rs.getInt("member_no"));
				result.setPtNo(rs.getInt("pt_no"));
				result.setReviewNo(rs.getInt("review_no"));
				result.setReviewContent(rs.getString("review_content").replace("\r\n","<br>"));
				result.setMemberNickname(rs.getString("member_nickname"));
				result.setMemberPhoto(rs.getString("member_photo"));
				result.setReviewRegistDate(rs.getDate("review_regist_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteReview(Connection conn, int reviewNo) {
		int result = 0;
		String sql = "delete tb_review "
				+ " where review_no = ?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
