package kh.semi.mtt.board.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.comment.model.vo.CommentVo;
import kh.semi.mtt.member.model.vo.MemberVo;

public class BoardDao {
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	public int deleteBoard(Connection conn, BoardVo vo) {
		int result = 0;
		String sql = "delete from tb_board where board_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBoardNo());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateBoard(Connection conn, BoardVo vo) {
		int result = 0;
		String sql = "update tb_board set BOARD_TITLE=?, BOARD_CONTENT=? where BOARD_NO=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getBoardTitle());
			pstmt.setString(2, vo.getBoardContent());
			pstmt.setInt(3, vo.getBoardNo());
			result = pstmt.executeUpdate();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertBoard(Connection conn, BoardVo vo, MemberVo mvo) {
//		String m_nickname = "aaa";
		int memberNo = vo.getMemberNo();
		int board_count = 0;
		int result = 0;
//		BOARD_NO          NOT NULL NUMBER         
//		MEMBER_NO         NOT NULL NUMBER         
//		BOARD_TITLE       NOT NULL VARCHAR2(200)  
//		BOARD_CONTENT     NOT NULL VARCHAR2(1000) 
//		BOARD_COUNT       NOT NULL NUMBER         
//		BOARD_DATE        NOT NULL DATE           
//		BOARD_CATEGORY_NO NOT NULL NUMBER(1)  
//		String sql = "insert into tb_board values((SELECT nvl(max(BOARD_NO),0)+1 from TB_board),(select member_no from tb_member where member_no = '" + memberNo + "'),"  
//				+ vo.getBoardTitle() + "','" 
//				+ vo.getBoardContent() + "','" 
//				+ board_count +"','" + "sysdate , default)";
		String sql = "insert into tb_board (board_no, MEMBER_NO, BOARD_TITLE, BOARD_CONTENT, BOARD_COUNT, BOARD_DATE, BOARD_CATEGORY_NO) "
				+ "values ((SELECT nvl(max(BOARD_NO),0)+1 from TB_board), "+mvo.getMemberNo()+", '"+ vo.getBoardTitle() +"', '"+vo.getBoardContent()+"', "+board_count+", default, default)";
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
		
	public BoardVo readBoard(Connection conn, int boardNo) {
		BoardVo vo = null;
		String sql = "select R, board_no, member_nickname, board_title, board_content, board_count, board_date, board_category_no, r_cnt from "
				+ " (select rownum r, t1.* from (select b1.*,(select count(*) from "
				+ " tb_comment r1 where r1.board_no = b1.board_no) r_cnt "
				+ " from tb_board b1 order by board_no desc) t1)tba join tb_member tbm on tba.member_no = tbm.member_no "
				+ " where board_no=?";
		
		String sql2 = "update tb_board set board_count = board_count+1 where board_no=?";
		int result = 0;
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			vo = new BoardVo();
			if(rs.next()) {
				vo.setBoardNo(rs.getInt("BOARD_NO"));
				vo.setBoardTitle(rs.getString("BOARD_TITLE"));
				vo.setMemberNickname(rs.getString("MEMBER_NICKNAME"));
				vo.setBoardContent(rs.getString("BOARD_CONTENT"));
				vo.setBoardCount(rs.getInt("BOARD_COUNT")+1);
				vo.setBoardDate(rs.getDate("BOARD_DATE"));
				vo.setrCnt(rs.getInt("R_CNT"));
				close(pstmt);
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, boardNo);
				result = pstmt.executeUpdate();
				if(result == 1) {
					System.out.println("BoardDao에서 조회수 1증가 됨");
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return vo;
		
	}
	
	
	public ArrayList<BoardVo> readAllBoard(Connection conn, int startRnum, int endRnum, int filterint, String search){ //매개인자로 필터 추가해서 정렬기능추가
		ArrayList<BoardVo> volist = null;
//		String sql = "select * from(select rownum r, t1.* from "
//		        + " (select b1.*,(select count(*) from tb_comment r1 where r1.board_no = b1.board_no) r_cnt " 
//		        + " from tb_board b1 order by board_no desc) t1)"
//		        + " where r between ? and ?";
		String sql = "select R, board_no, member_nickname, board_title, board_content, board_count, board_date, board_category_no, r_cnt from "
				+ " (select rownum r, t1.* from (select b1.*,(select count(*) from "
				+ " tb_comment r1 where r1.board_no = b1.board_no) r_cnt "
				+ " from tb_board b1 order by board_no asc) t1)tba join tb_member tbm on tba.member_no = tbm.member_no "
				+ " where r between ? and ?"
				+ " order by R DESC, board_date asc ";
		
		if(search != null ) {
			sql = "select R, board_no, member_nickname, board_title, board_content, board_count, board_date, board_category_no, r_cnt from "
					+ " (select rownum r, t1.* from (select b1.*,(select count(*) from "
					+ " tb_comment r1 where r1.board_no = b1.board_no) r_cnt "
					+ " from tb_board b1 order by board_no asc) t1)tba join tb_member tbm on tba.member_no = tbm.member_no "
					+ " where r between ? and ? "
					+ " and board_title like ? "
					+ " order by R DESC, board_date asc ";
		}
		if(filterint == 1) {
			 sql = "select R, board_no, member_nickname, board_title, board_content, board_count, board_date, board_category_no, r_cnt from "
					+ " (select rownum r, t1.* from (select b1.*,(select count(*) from "
					+ " tb_comment r1 where r1.board_no = b1.board_no) r_cnt "
					+ " from tb_board b1 order by board_no asc) t1)tba join tb_member tbm on tba.member_no = tbm.member_no "
					+ " where r between ? and ?"
					+ " order by R DESC, board_date asc ";
			
		}else if(filterint == 2) {
			sql = "select R, board_no, member_nickname, board_title, board_content, board_count, board_date, board_category_no, r_cnt from "
					+ " (select rownum r, t1.* from (select b1.*,(select count(*) from "
					+ " tb_comment r1 where r1.board_no = b1.board_no) r_cnt "
					+ " from tb_board b1 order by board_no asc) t1)tba join tb_member tbm on tba.member_no = tbm.member_no "
					+ " where r between ? and ?"
					+ " order by board_count desc ";
			
		}else if(filterint == 3) {
			sql = "select R, board_no, member_nickname, board_title, board_content, board_count, board_date, board_category_no, r_cnt from "
					+ " (select rownum r, t1.* from (select b1.*,(select count(*) from "
					+ " tb_comment r1 where r1.board_no = b1.board_no) r_cnt "
					+ " from tb_board b1 order by board_no desc) t1)tba join tb_member tbm on tba.member_no = tbm.member_no "
					+ " where r between ? and ?"
					+ " order by r_cnt desc";
		}else if (filterint == 4) {
			sql = "select rownum r, t1.* from (select board_title, ROUTINE_BOARD_TITLE, BOARD_DATE, ROUTINE_BOARD_DATE, BOARD_COUNT, ROUTINE_BOARD_COUNT, tb.BOARD_CATEGORY_NO bcn1, trb.BOARD_CATEGORY_NO bcn2"
					+ "    from tb_board_report tbr"
					+ "    , tb_board tb"
					+ "    , tb_routine_board trb"
					+ "    where tbr.board_no = tb.board_no(+) AND tbr.routine_board_no = trb.routine_board_no(+)"
					+ "    order by BOARD_DATE, ROUTINE_BOARD_DATE)t1"
					+ "    order by r desc";
		}
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);		
			pstmt.setInt(2, endRnum);
			if(search != null) {
				System.out.println("pstmt.setString(3,search):" + search);
				pstmt.setString(3, "%"+search+"%");
			}
			rs = pstmt.executeQuery();
			if(rs != null) {
				volist = new ArrayList<BoardVo>();
				while (rs.next()) {
					BoardVo vo = new BoardVo();
					vo.setBoardNo(rs.getInt("R"));
					vo.setBoardDate(rs.getDate("BOARD_DATE"));
					vo.setBoardTitle(rs.getString("BOARD_TITLE"));
					vo.setBoardContent(rs.getString("BOARD_CONTENT"));
					vo.setBoardCount(rs.getInt("BOARD_COUNT"));
					vo.setMemberNickname(rs.getString("MEMBER_NICKNAME"));
					vo.setBoardCategoryNumber(rs.getInt("BOARD_CATEGORY_NO"));
					vo.setrCnt(rs.getInt("R_CNT"));
//					System.out.println("댓글수"+rs.getInt("R_CNT"));
					volist.add(vo);
					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			close(rs);
			close(pstmt);
		}
		return volist;
	}
	
	public int boardViewCount(Connection conn ,BoardVo vo) {
		String sql = "update tb_board set board_count = board_count+1 where board_no=?";
		
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBoardNo());
			result = pstmt.executeUpdate();
			
			System.out.println("조회수 1증가");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(conn);
			close(pstmt);
		}
		return result;
	}
	
	// 특정 회원이 작성한 게시물 리스트 조회 - 서유빈 작성
	public ArrayList<BoardVo> readOneMemberBoard(Connection conn, int startRnum, int endRnum, String memberId) {
		ArrayList<BoardVo> volist = null;
		String sql = "select R, board_no, board_title, board_count, board_date, r_cnt "
				+ "from (select rownum r, t1.* "
				+ "from (select b1.*,(select count(*) "
				+ "from tb_comment r1 where r1.board_no = b1.board_no) r_cnt "
				+ "from tb_board b1 order by board_no desc) t1)tba "
				+ "join tb_member tbm on tba.member_no = tbm.member_no "
				+ "where r between ? and ? and member_id = ? order by r desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);		
			pstmt.setInt(2, endRnum);
			pstmt.setString(3, memberId);		
			rs = pstmt.executeQuery();
			if(rs != null) {
				volist = new ArrayList<BoardVo>();
				while (rs.next()) {
					BoardVo vo = new BoardVo();
					vo.setBoardNo(rs.getInt("R"));
					vo.setBoardTitle(rs.getString("BOARD_TITLE"));
					vo.setBoardCount(rs.getInt("BOARD_COUNT"));
					vo.setBoardDate(rs.getDate("BOARD_DATE"));
					vo.setrCnt(rs.getInt("R_CNT"));
					volist.add(vo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			close(rs);
			close(pstmt);
		}
		
		return volist;
	}
	
	// 특정 회원이 작성한 댓글 리스트 조회 - 서유빈 작성
		public ArrayList<CommentVo> readOneMemberComment(Connection conn, int startRnum, int endRnum, String memberId) {
			ArrayList<CommentVo> volist = null;
			String sql = "select r, comment_content, comment_date from (select t1.*, rownum r from (select c.comment_date, c.comment_content, c.comment_no from tb_comment c join tb_member m on c.member_no = m.member_no where member_id =?)t1)t2 where r between ? and ? order by r desc";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(2, endRnum);
				pstmt.setInt(3, startRnum);		
				pstmt.setString(1, memberId);		
				rs = pstmt.executeQuery();
				if(rs != null) {
					volist = new ArrayList<CommentVo>();
					while (rs.next()) {
						CommentVo vo = new CommentVo();
						vo.setrCnt(rs.getInt("r"));
						vo.setCommentContent(rs.getString("comment_content"));
						vo.setCommentDate(rs.getTimestamp("comment_date"));
						volist.add(vo);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}  finally {
				close(rs);
				close(pstmt);
			}
			
			return volist;
		}

		
		
		
		
		
		
		
		
		
		
		
		
	
	// 보드 카운트 (기본)
	public int countBoard(Connection conn) {
		int result = 0;
		String sql = "select count(*) as cnt from tb_board";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			close(rs);
			close(pstmt);
		}

		return result;

	}
	
	// 보드 카운트 (서유빈)
	public int countBoard_member(Connection conn, String memberId) {
		int result = 0;
		String sql = "select count(*) as cnt from tb_board join tb_member on tb_board.member_no = tb_member.member_no where member_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);	
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// 코멘트 카운트 (서유빈)
		public int countComment_member(Connection conn, String memberId) {
			int result = 0;
			String sql = "select count(*) as cnt from tb_comment join tb_member on tb_comment.member_no = tb_member.member_no where member_id=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);	
				rs = pstmt.executeQuery();
				if (rs.next()) {
					result = rs.getInt("cnt");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			finally {
				close(rs);
				close(pstmt);
			}
			return result;
		}
	
}
