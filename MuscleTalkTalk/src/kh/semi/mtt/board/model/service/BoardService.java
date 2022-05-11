package kh.semi.mtt.board.model.service;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import kh.semi.mtt.board.model.dao.BoardDao;
import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.comment.model.vo.CommentVo;
import kh.semi.mtt.member.model.vo.MemberVo;

public class BoardService {
	private BoardDao dao = new BoardDao();
	
	public int deleteBoard(BoardVo vo) {
		Connection conn = null;
		conn = getConnection();
		
		int result = dao.deleteBoard(conn, vo);
		close(conn);
		
		return result;
	}
	
	public int updateBoard(BoardVo vo) {
		Connection conn = null;
		conn = getConnection();
		System.out.println("updateBoard vo : " + vo);
		
		int result = dao.updateBoard(conn, vo);
		
		close(conn);
		return result;
	}
	
	public int insertBoard(BoardVo vo, MemberVo mvo) {
		Connection conn = null;
		
		conn = getConnection();
		
		int result = dao.insertBoard(conn, vo, mvo); 
		
		close(conn);
		return result;
	}
	
	public BoardVo readBoard(int boardNo) {
		Connection conn = null;
		conn = getConnection();
		
		BoardVo result = dao.readBoard(conn, boardNo);
		close(conn);
		return result;
	}
	
	public ArrayList<BoardVo> readAllBoard(int startRnum, int endRnum,int filterint,  String search){
		
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<BoardVo> result = dao.readAllBoard(conn, startRnum, endRnum,filterint,search);
		close(conn);
		return result;
		
	}
	
	public ArrayList<BoardVo> readOneMemberBoard(int startRnum, int endRnum, int memberNo){
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<BoardVo> volist = dao.readOneMemberBoard(conn, startRnum, endRnum, memberNo);
		close(conn);
		return volist;
	}
	public ArrayList<CommentVo> readOneMemberComment(int startRnum, int endRnum, int memberNo){
		Connection conn = null;
		conn = getConnection();
			
		ArrayList<CommentVo> volist = dao.readOneMemberComment(conn, startRnum, endRnum, memberNo);
		close(conn);
		return volist;
	}
	
	
	
	
	
	
	
	
	
	public int countBoard() {
		Connection conn = null;
		conn = getConnection();
		
		int result =  dao.countBoard(conn);
		close(conn);
		return result;
	}
	
	public int countBoard_member(int memberNo) {
		Connection conn = null;
		conn = getConnection();
			
		int result =  dao.countBoard_member(conn, memberNo);
		close(conn);
		return result;
	}
	
	public int countComment_member(int memberNo) {
		Connection conn = null;
		conn = getConnection();
				
		int result =  dao.countComment_member(conn, memberNo);
		close(conn);
		return result;
	}
	
	
	
}
