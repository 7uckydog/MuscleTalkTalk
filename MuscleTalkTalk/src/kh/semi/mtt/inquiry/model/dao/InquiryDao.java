package kh.semi.mtt.inquiry.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kh.semi.mtt.inquiry.model.vo.InquiryVo;

public class InquiryDao {
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private String sql = "";

	// 특정 회원의 1:1 문의 리스트 조회
	public ArrayList<InquiryVo> readOneMemberInquiry(Connection conn, int startRnum, int endRnum, String memberId) {
		ArrayList<InquiryVo> volist = null;
		sql="select r, inquiry_title, inquiry_content, inquiry_date "
				+ "from (select t1.*, rownum r "
				+ "from (select i.inquiry_title, i.inquiry_content, i.inquiry_date "
				+ "from tb_inquiry i join tb_member m on i.member_no = m.member_no where member_id = ? order by inquiry_date desc)t1)t2 "
				+ "where r between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(3, endRnum);
			pstmt.setInt(2, startRnum);
			rs = pstmt.executeQuery();
			if (rs != null) {
				volist = new ArrayList<InquiryVo>();
				while (rs.next()) {
					InquiryVo vo = new InquiryVo();
					vo.setInquiryNo(rs.getInt("r"));
					vo.setInquiryTitle(rs.getString("inquiry_title"));
					vo.setInquiryContent(rs.getString("inquiry_content"));
					vo.setInquiryDate(rs.getDate("inquiry_date"));
					volist.add(vo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return volist;
	}

	// 1:1 문의 상세 조회
	public InquiryVo readinquiry(Connection conn, String memberId, String inquiryTitle) {
		InquiryVo ivo = null;
		sql = "select * from tb_inquiry i join tb_member m on i.member_no = m.member_no where member_id= ? and inquiry_title= ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, inquiryTitle);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ivo = new InquiryVo();
				ivo.setInquiryTitle(rs.getString("inquiry_title"));
				ivo.setInquiryContent(rs.getString("inquiry_content"));
				ivo.setInquiryAnswer(rs.getString("inquiry_answer"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return ivo;
	}

	// 1:1 문의하기
	public int insertInquiry(Connection conn, int memberNo, String inqTitle, String inqContent) {
		int result = 0;
		sql = "insert into tb_inquiry (inquiry_no, member_no, inquiry_title, inquiry_content, inquiry_date, inquiry_check)"
				+ " values ((select nvl(max(inquiry_no),0)+1 from tb_inquiry), ?, ?, ?, sysdate, default)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, inqTitle);
			pstmt.setString(3, inqContent);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result;
	}

	// 한 명의 회원 문의 카운트 (서유빈)
	public int countInquiry_member(Connection conn, String memberId) {
		int result = 0;
		sql = "select count(*) as cnt from tb_inquiry join tb_member on tb_inquiry.member_no = tb_member.member_no where member_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<InquiryVo> readAllInquiry(Connection conn, int startRnum, int endRnum, String memberId) {
		ArrayList<InquiryVo> volist = null;
		sql = "select r,inquiry_no, inquiry_title, inquiry_date, member_nickname, inquiry_check "
				+ "				from (select t1.*, rownum r " + "				from (select i.*, m.member_nickname "
				+ "				from tb_inquiry i join tb_member m on i.member_no = m.member_no)t1)t2 "
				+ "				where r between ? and ? order by r desc";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(2, endRnum);
			pstmt.setInt(1, startRnum);
			rs = pstmt.executeQuery();
			if (rs != null) {
				volist = new ArrayList<InquiryVo>();
				while (rs.next()) {
					InquiryVo vo = new InquiryVo();
					vo.setRownum(rs.getInt("r"));
					vo.setInquiryNo(rs.getInt("inquiry_no"));
					vo.setInquiryTitle(rs.getString("inquiry_title"));
					vo.setInquiryDate(rs.getDate("inquiry_date"));
					vo.setInquiryCheck(rs.getString("inquiry_check"));
					vo.setMemberNickname(rs.getString("member_nickname"));
					volist.add(vo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return volist;
	}

	public int answerInquiry(Connection conn, InquiryVo vo) {
		int result = 0;
		String sql = "update tb_inquiry set INQUIRY_ANSWER = ?, inquiry_check = 'T' where INQUIRY_NO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getInquiryAnswer());
			pstmt.setInt(2, vo.getInquiryNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int countInquiry(Connection conn) {
		int result = 0;
		sql = "select count(*) count from tb_inquiry";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public InquiryVo readInquiryAdmin(Connection conn, int inquiryNo) {
		InquiryVo ivo = null;
		sql = "select * from tb_inquiry where inquiry_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inquiryNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ivo = new InquiryVo();
				ivo.setInquiryTitle(rs.getString("inquiry_title"));
				ivo.setInquiryContent(rs.getString("inquiry_content"));
				ivo.setInquiryAnswer(rs.getString("inquiry_answer"));
				ivo.setInquiryNo(rs.getInt("inquiry_no"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return ivo;
	}
}
