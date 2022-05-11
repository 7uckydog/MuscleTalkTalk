package kh.semi.mtt.review.model.service;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;
import static kh.semi.mtt.common.jdbc.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.mtt.review.model.dao.ReviewDao;
import kh.semi.mtt.review.model.vo.ReviewVo;



public class ReviewService {
	ReviewDao dao = new ReviewDao();
	
	public int insertReview(ReviewVo vo) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.insertReview(conn, vo);
		
		close(conn);
		return result;
	}
	
	public ArrayList<ReviewVo> readReview(int ptNo) {
		ArrayList<ReviewVo> result = null;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.readReview(conn, ptNo);
		
		close(conn);
		return result;
	}
}
