package kh.semi.mtt.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import kh.semi.mtt.notice.model.vo.NoticeVo;

public class NoticeDao {
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public int insertNotice(Connection conn, NoticeVo vo) {
		int memberNo = 1;
		int result = 0;

		String sql = "insert into tb_notice values ( (SELECT nvl(max(NOTICE_NO),0)+1 from TB_NOTICE), '" 
				+ memberNo + "', '"+vo.getNotiTitle()+"', '"+vo.getNotiContent()+"', default, sysdate)";
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
	
	public NoticeVo readNotice(Connection conn, int noticeNo) {
		NoticeVo vo = null;            //1 첫줄 : 리턴자료형으로 변수선언
		String sql = "select * from tb_board where notice_no= ? ";   //2 둘째줄 : sql문 


		try {  //4.
			pstmt = conn.prepareStatement(sql);   //3. 
			pstmt.setInt(1, noticeNo);     //7 : 위 2번 물음표 있어서 작성. 
			rs = pstmt.executeQuery();  //8
			vo = new NoticeVo();   //9 : 위의 1번 자료형에 따라 생성자 사용. (기본자료형이라면 안해도됨)
			if(rs.next()) {  //10 : 위 2번의 조건식 pk 이용 - 결과단일행. while반복 필요 x rs.next 해줘야 읽으러감
//			11. 리턴 변수 값 채우기!!!!!!!	rs.getString("b_title");
				vo.setNotiContent(rs.getString("notice_Content"));
				vo.setNotiCnt(rs.getInt("notice_count"));
				vo.setNotiTitle(rs.getString("notice_title"));
				vo.setNotiDate(rs.getTimestamp("notice_date"));
				vo.setNoticeNo(rs.getInt("notice_no"));
				
				close(rs);
				close(pstmt);
				
//				pstmt = conn.prepareStatement(sql2);   //3. 
//				pstmt.setInt(1, noticeNo);     //7 : 위 2번 물음표 있어서 작성. 
//				rs = pstmt.executeQuery();  //8
				
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);  //5  위 2번 select여서 작성
			close(pstmt);  //6
		}

		return vo;  //1 : 리턴함
	}
	
	public ArrayList<NoticeVo> readAllNotice(Connection conn, int startNnum, int endNnum){
		ArrayList<NoticeVo> volist = null;
		String sql = "select notice_no, notice_title, notice_date from tb_notice order by notice_no desc"
				+ "where notice_no between? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNnum);
			pstmt.setInt(2, endNnum);
			rs = pstmt.executeQuery();
			
			if (rs != null) { // SQLException 외 예외상황
				volist = new ArrayList<NoticeVo>();
				while (rs.next()) {
					NoticeVo vo = new NoticeVo();
					vo.setNoticeNo(rs.getInt("notice_No"));
					vo.setNotiTitle(rs.getString("notice_Title"));
					vo.setNotiDate(rs.getTimestamp("notice_Date"));
					vo.setNotiContent(rs.getString("notice_Content"));
					
					
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

	public int countNotice(Connection conn) {
		int result = 0;
		String sql = "select count(*) count from tb_notice";
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
