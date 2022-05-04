package kh.semi.mtt.comment.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kh.semi.mtt.comment.model.vo.CommentVo;

public class CommentDao {
	
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	
	public int writeBoardReComment(Connection conn, CommentVo vo) {
		// TODO: member 로그인 완료 후 수정
		int memberNo = 13;
		int result = 0;
		
		String sql = "insert into tb_comment (COMMENT_NO, BOARD_NO, MEMBER_NO, COMMENT_DATE, COMMENT_EDIT_DATE, COMMENT_CONTENT)" + " values"
				+ "((select nvl(max(COMMENT_NO),0)+1 from tb_comment)" + ",?"
				+ ",?" + ",sysdate,sysdate,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 지정
			pstmt.setInt(1, vo.getBoardNo()); 
			pstmt.setInt(2, memberNo);
			pstmt.setString(3, vo.getCommentContent());

			// sql문 실행
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<CommentVo> readBoardReComment(Connection conn, int boardNo){
		ArrayList<CommentVo> volist = null;
//		String sql = "select * from tb_comment where BOARD_NO = ?";  //이 테이블에서 b_no는 fk임
//		select comment_no, board_no, member_nickname, comment_content, comment_date, comment_edit_date
//	    from tb_comment join tb_member on tb_comment.member_no = tb_member.member_no where board_no = 1;
		String sql = "select rownum r, t1.* from(select comment_no, board_no, member_nickname, comment_content, comment_date, comment_edit_date "
				+ "from tb_comment "
				+ "join tb_member on tb_comment.member_no = tb_member.member_no "
				+ "where board_no = ? order by comment_date desc) t1 "
				+ "order by r desc";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			volist = new ArrayList<CommentVo>();
			
			while(rs.next()) { // fk임 -결과가 1개이상 반복문 사용
				CommentVo vo = new CommentVo();
				vo.setBoardNo(rs.getInt("BOARD_NO"));
				vo.setCommentContent(rs.getNString("COMMENT_CONTENT"));
				vo.setCommentNo(rs.getInt("COMMENT_NO"));
				vo.setCommentDate(rs.getTimestamp("COMMENT_DATE"));
				vo.setCommentEditDate(rs.getTimestamp("COMMENT_EDIT_DATE"));
				vo.setMemberNickname(rs.getString("MEMBER_NICKNAME"));
				vo.setRownum(rs.getInt("r"));
				volist.add(vo);  //리턴 변수에 값 채우기
			} 
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return volist;
	}
	
	public ArrayList<CommentVo> readAllComment(Connection conn, int startRnum, int endRnum, String search){
		ArrayList<CommentVo> volist = null;
		String sql = "select * "
				+ "    from(select rownum r, tta.*"
				+ "        from (select tc.*, member_nickname "
				+ "            from tb_comment tc"
				+ "            left outer join tb_member tm on tc.member_no = tm.member_no"
				+ "            order by comment_no desc) tta)"
				+ "            where r between ? and ?"
				+ "            order by r desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
			
			rs = pstmt.executeQuery();
			if (rs != null) {
				volist = new ArrayList<CommentVo>();
				
				while (rs.next()) {
					CommentVo vo = new CommentVo();
					vo.setBoardNo(rs.getInt("BOARD_NO"));
					vo.setRoutineboardNo(rs.getInt("routine_board_no"));
					vo.setCommentContent(rs.getNString("COMMENT_CONTENT"));
					vo.setCommentNo(rs.getInt("COMMENT_NO"));
					vo.setCommentDate(rs.getTimestamp("COMMENT_DATE"));
					vo.setCommentEditDate(rs.getTimestamp("COMMENT_EDIT_DATE"));
					vo.setMemberNickname(rs.getString("MEMBER_NICKNAME"));
					vo.setRownum(rs.getInt("r"));
					volist.add(vo);  //리턴 변수에 값 채우기
					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return volist;
	}
	
	public int countComment(Connection conn) {
		int result = 0;
		String sql = "select count(*) count from tb_comment";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("count"); // 별칭 없이 1 이라고해도됨(1번컬럼)
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
