package kh.semi.mtt.board.model.service;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import kh.semi.mtt.board.model.dao.BoardDao;
import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.comment.model.vo.CommentVo;

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
	
	public int insertBoard(BoardVo vo) {
		Connection conn = null;
		
		conn = getConnection();
		
		int result = dao.insertBoard(conn, vo); 
		
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
	
	public ArrayList<BoardVo> readAllBoard(int startRnum, int endRnum,int filterint){
		
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<BoardVo> result = dao.readAllBoard(conn, startRnum, endRnum,filterint);
		close(conn);
		return result;
		
	}
	
	// Ư�� ȸ���� �ۼ��� �Խù� ����Ʈ ��ȸ - ������ �ۼ�
	public ArrayList<BoardVo> readOneMemberBoard(int startRnum, int endRnum, String memberId){
		Connection conn = null;
		conn = getConnection();
		
		ArrayList<BoardVo> volist = dao.readOneMemberBoard(conn, startRnum, endRnum, memberId);
		close(conn);
		return volist;
	}
	// Ư�� ȸ���� �ۼ��� ��� ����Ʈ ��ȸ - ������ �ۼ�
	public ArrayList<CommentVo> readOneMemberComment(int startRnum, int endRnum, String memberId){
		Connection conn = null;
		conn = getConnection();
			
		ArrayList<CommentVo> volist = dao.readOneMemberComment(conn, startRnum, endRnum, memberId);
		close(conn);
		return volist;
	}
	
	
	
	
	
	
	
	
	
	// ���� ī��Ʈ (�⺻)
	public int countBoard() {
		Connection conn = null;
		conn = getConnection();
		
		int result =  dao.countBoard(conn);
		close(conn);
		return result;
	}
	
	// ���� ī��Ʈ (������)
	public int countBoard_member(String memberId) {
		Connection conn = null;
		conn = getConnection();
			
		int result =  dao.countBoard_member(conn, memberId);
		close(conn);
		return result;
	}
	
	// �ڸ�Ʈ ī��Ʈ (������)
	public int countComment_member(String memberId) {
		Connection conn = null;
		conn = getConnection();
				
		int result =  dao.countComment_member(conn, memberId);
		close(conn);
		return result;
	}
	
	
	
}
