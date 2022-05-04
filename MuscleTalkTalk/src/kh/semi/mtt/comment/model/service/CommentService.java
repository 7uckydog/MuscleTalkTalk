package kh.semi.mtt.comment.model.service;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.mtt.comment.model.dao.CommentDao;
import kh.semi.mtt.comment.model.vo.CommentVo;

public class CommentService {
	CommentDao dao = new CommentDao();
	
	public int writeBoardReComment(CommentVo vo) {
		Connection conn = null;
		
		conn = getConnection();
	
		int result = dao.writeBoardReComment(conn, vo);
		
		close(conn);
		return result;
		
	}
	public ArrayList<CommentVo> readBoardReComment(int boardNo){
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<CommentVo> vo = dao.readBoardReComment(conn, boardNo);
		close(conn);
		
		return vo;
	}
	
	public ArrayList<CommentVo> readAllComment(int startRnum, int endRnum, String search){
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<CommentVo> vo = dao.readAllComment(conn, startRnum, endRnum, search);
		close(conn);
		
		return vo;
	}
	
	public int countComment() {
		Connection conn = null;
		conn = getConnection();
		
		int result =  dao.countComment(conn);
		close(conn);
		return result;
	}


}
