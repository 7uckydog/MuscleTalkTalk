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
import kh.semi.mtt.member.model.vo.AdminVo;
import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.totalboard.model.vo.TotalBoardVo;

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
	
	
	
	public ArrayList<TotalBoardVo> totalBoardReadAll(Connection conn, int startRnum, int endRnum, int filterint, String search){
			ArrayList<TotalBoardVo> tolist = null;
			System.out.println("통합보드 dao1");
			
			String sql = "select * "
					+ " from (select rownum r, t1.*"
					+ " from(select *"
					+ " from (select tb.board_no, member_nickname, board_title, board_count, board_date, board_category_no, rcnt"
					+ " from tb_board tb"
					+ " left outer join (select count(comment_no) rcnt, board_no from tb_comment group by board_no) tc"
					+ " on tb.board_no = tc.board_no"
					+ " join tb_member tm"
					+ " on tb.member_no = tm.member_no"
					+ " "
					+ " union"
					+ " "
					+ " select trb.routine_board_no, member_nickname, routine_board_title, routine_board_count, routine_board_date, board_category_no, rcnt"
					+ " from tb_routine_board trb"
					+ " left outer join (select count(comment_no) rcnt, routine_board_no from tb_comment group by routine_board_no) tc"
					+ " on trb.routine_board_no = tc.routine_board_no"
					+ " join tb_member tm"
					+ " on trb.member_no = tm.member_no) "
					+ " ) t1)"
					+ " where r between ? and ? order by r desc ,board_date desc";
			
			System.out.println("통합보드 dao2");
			try {
				System.out.println("통합보드 dao2-1");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRnum);
				pstmt.setInt(2, endRnum);
				
				rs = pstmt.executeQuery();
				System.out.println("통합보드 dao2-2");
				if(rs != null) {
					tolist = new ArrayList<TotalBoardVo>();
					System.out.println("통합보드 dao2-3");
					System.out.println(sql);
						while(rs.next()) {
							TotalBoardVo tvo = new TotalBoardVo();
							
							tvo.setTotalboardR(rs.getInt("r"));
							tvo.setBoardNo(rs.getInt("BOARD_NO"));
							tvo.setBoardTitle(rs.getString("board_title"));
//							tvo.setBoardContent(rs.getString("board_content"));
							tvo.setBoardCount(rs.getInt("board_count"));
							tvo.setBoardDate(rs.getDate("board_date"));
							tvo.setBoardCategoryNumber(rs.getInt("board_category_no"));
//							tvo.setMemberNo(rs.getInt("member_no"));
//							tvo.setRoutineboardNo(rs.getInt("routine_board_no"));
//							tvo.setRoutineNo(rs.getInt("routine_no"));
							tvo.setMemberNickname(rs.getString("member_nickname"));
							tvo.setrCnt(rs.getInt("rcnt"));
//							tvo.setRoutineboardTitle(rs.getString("routine_board_title"));
//							tvo.setRoutineboardContent(rs.getString("routine_board_content"));
//							tvo.setRoutineboardCount(rs.getInt("routine_board_count"));
//							tvo.setRoutineboardDate(rs.getDate("routine_board_date"));
//							tvo.setRoutineboardShare(rs.getInt("routine_board_share"));
							
							System.out.println("통합보드 dao3");
							tolist.add(tvo);
							System.out.println(tolist);
						}
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			System.out.println("통합보드 dao4");
			System.out.println(tolist);
			return tolist;
	}
	
	
	public int countTotalBoard (Connection conn) {
		int result = 0;
		String sql = "select count(*) cnt from("
				+ "select tb.board_no, member_nickname, board_title, board_count, board_date, board_category_no, rcnt"
				+ "    from tb_board tb"
				+ "    left outer join (select count(comment_no) rcnt, board_no from tb_comment group by board_no) tc"
				+ "    on tb.board_no = tc.board_no"
				+ "    join tb_member tm"
				+ "    on tb.member_no = tm.member_no"
				+ "    "
				+ "    union"
				+ "    "
				+ "select trb.routine_board_no, member_nickname, routine_board_title, routine_board_count, routine_board_date, board_category_no, rcnt"
				+ "    from tb_routine_board trb"
				+ "    left outer join (select count(comment_no) rcnt, routine_board_no from tb_comment group by routine_board_no) tc"
				+ "    on trb.routine_board_no = tc.routine_board_no"
				+ "    join tb_member tm"
				+ "    on trb.member_no = tm.member_no)";
				
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
		
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
		System.out.println("자유게시판 sql");
		System.out.println(sql);
		System.out.println("자유게시판 sql-----");
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
					vo.setBoardR(rs.getInt("r"));
					vo.setBoardNo(rs.getInt("board_no"));
					vo.setBoardDate(rs.getDate("BOARD_DATE"));
					vo.setBoardTitle(rs.getString("BOARD_TITLE"));
					vo.setBoardContent(rs.getString("BOARD_CONTENT"));
					vo.setBoardCount(rs.getInt("BOARD_COUNT"));
					vo.setMemberNickname(rs.getString("MEMBER_NICKNAME"));
					vo.setBoardCategoryNumber(rs.getInt("BOARD_CATEGORY_NO"));
					vo.setrCnt(rs.getInt("R_CNT"));
//					System.out.println("댓글수"+rs.getInt("R_CNT"));
					volist.add(vo);
					System.out.println("자유게시판 volist");
					System.out.println(vo);
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
	public ArrayList<BoardVo> readOneMemberBoard(Connection conn, int startRnum, int endRnum, int memberNo) {
		ArrayList<BoardVo> volist = null;
		String sql = "select r, board_title, board_content, board_date, routine_board_title, routine_board_content, routine_board_date, board_no, routine_board_no, routine_board_count, board_count, bm, tm, bc, tc, greatest(nvl(board_date,'1111-01-01'), nvl(routine_board_date,'1111-01-01')) g"
				+ "    from (select t1.*, rownum r from (select b.board_title, b.board_content, b.board_date, t.routine_board_title , t.routine_board_content, t.routine_board_date, b.board_no, t.routine_board_no, b.board_count, t.routine_board_count, b.member_no bm, t.member_no tm, b.board_category_no bc, t.board_category_no tc"
				+ "    from tb_board b full outer join tb_routine_board t on b.board_category_no = t.board_category_no where b.member_no = ? or t.member_no = ?"
				+ "    order by greatest(nvl(board_date,'1111-01-01'), nvl(routine_board_date,'1111-01-01'))desc ) t1) t2 where r between ? and ?";
		// bm = tb_board의      member_no
		// tm = tb_routine_board의      member_no
		// bc = tb_board의      board_category_no
		// tc = tb_routine_board의      board_category_no
		// g = date를 비교하여 최신순으로 정렬
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, memberNo);
			pstmt.setInt(3, startRnum);
			pstmt.setInt(4, endRnum);
			rs = pstmt.executeQuery();
			if(rs != null) {
				volist = new ArrayList<BoardVo>();
				while (rs.next()) {
					BoardVo vo = new BoardVo();
					
					if(rs.getInt("board_no") > 0) {
						vo.setBoardR(rs.getInt("r"));
						vo.setBoardNo(rs.getInt("board_no"));
						vo.setBoardTitle(rs.getString("board_title"));
						vo.setBoardContent(rs.getString("board_content"));
						vo.setBoardCount(rs.getInt("board_count"));
						vo.setBoardDate(rs.getDate("board_date"));
						vo.setBoardCategoryNumber(rs.getInt("bc"));
					} else if(rs.getInt("routine_board_no") > 0) {
						vo.setBoardR(rs.getInt("r"));
						vo.setBoardNo(rs.getInt("routine_board_no"));
						vo.setBoardTitle(rs.getString("routine_board_title"));
						vo.setBoardContent(rs.getString("routine_board_content"));
						vo.setBoardCount(rs.getInt("routine_board_count"));
						vo.setBoardDate(rs.getDate("routine_board_date"));
						vo.setBoardCategoryNumber(rs.getInt("tc"));
					}
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
		public ArrayList<CommentVo> readOneMemberComment(Connection conn, int startRnum, int endRnum, int memberNo) {
			ArrayList<CommentVo> volist = null;
			String sql = "select r, comment_content, comment_date, board_no, routine_board_no, member_no"
					+ "    from (select t1.*, rownum r from (select c.comment_content, c.comment_date, c.board_no, c.routine_board_no, c.member_no"
					+ "    from tb_comment c full outer join tb_board b on c.board_no = b.board_no"
					+ "    where c.member_no = ? order by comment_date desc)t1) t2 where r between ? and ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(2, endRnum);
				pstmt.setInt(3, startRnum);		
				pstmt.setInt(1, memberNo);		
				rs = pstmt.executeQuery();
				if(rs != null) {
					volist = new ArrayList<CommentVo>();
					while (rs.next()) {
						CommentVo vo = new CommentVo();
						vo.setrCnt(rs.getInt("r"));
						vo.setBoardNo(rs.getInt("board_no"));
						vo.setRoutineboardNo(rs.getInt("routine_board_no"));
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
	public int countBoard_member(Connection conn, int memberNo) {
		int result = 0;
		String sql = "select * from (select count(*) cnt1 from tb_board where member_no = ?), (select count(*) cnt2 from tb_routine_board where member_no = ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);	
			pstmt.setInt(2, memberNo);	
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result += rs.getInt("cnt1");
				result += rs.getInt("cnt2");
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
		public int countComment_member(Connection conn, int memberNo) {
			int result = 0;
			String sql = "select count(*) as cnt from tb_comment join tb_member on tb_comment.member_no = tb_member.member_no where tb_comment.member_no=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memberNo);	
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
	
		
		public ArrayList<BoardVo> mainBoard(Connection conn) { //매개인자로 필터 추가해서 정렬기능추가
			ArrayList<BoardVo> volist = new ArrayList<BoardVo>();
			String sql = "select * "
					+ "    from (select rownum r, t1.* "
					+ "    from (select tb.board_no, board_title, tbcnt.comment_cnt "
					+ "    from tb_board tb "
					+ "    left outer join (select count(comment_no) comment_cnt, board_no from tb_comment "
					+ "    where board_no is not null "
					+ "    group by board_no) tbcnt "
					+ "    on tb.board_no = tbcnt.board_no "
					+ "    where board_date "
					+ "    between sysdate - 1 and sysdate "
					+ "    order by board_count desc) t1) "
					+ "    where r between 1 and 10";
			try {
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					BoardVo vo = new BoardVo();
					vo.setBoardNo(rs.getInt("board_no"));
					vo.setBoardTitle(rs.getString("board_title"));
					vo.setrCnt(rs.getInt("comment_cnt"));
					
					volist.add(vo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}  finally {
				close(rs);
				close(pstmt);
			}
			return volist;
		}
		
		//dashboard 숫자세기 (진정)
		public ArrayList<AdminVo> dashboardBoard(Connection conn){
			ArrayList<AdminVo> volist = null;
			String sql = "select count(*) dcnt, sysdate Dateval from tb_board where board_date <= sysdate"
					+ "    union select count(*) dcnt, sysdate-1 Dateval from tb_board where board_date <= sysdate - 1"
					+ "    union select count(*) dcnt, sysdate-2 Dateval from tb_board where board_date <= sysdate - 2"
					+ "    union select count(*) dcnt, sysdate-3 Dateval from tb_board where board_date <= sysdate - 3"
					+ "    union select count(*) dcnt, sysdate-4 Dateval from tb_board where board_date <= sysdate - 4"
					+ "    union select count(*) dcnt, sysdate-5 Dateval from tb_board where board_date <= sysdate - 5"
					+ "    order by Dateval desc";
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs != null) {
					volist = new ArrayList<AdminVo>();
					while(rs.next()) {
						AdminVo vo = new AdminVo();
						vo.setDcnt(rs.getInt("dcnt"));
						vo.setDateval(rs.getDate("dateval"));
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
}
