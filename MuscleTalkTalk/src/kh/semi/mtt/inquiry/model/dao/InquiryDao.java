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
	
	public ArrayList<InquiryVo> readOneMemberInquiry(Connection conn, int startRnum, int endRnum, String memberId){
		ArrayList<InquiryVo> volist = null;
		sql="select r, inquiry_title, inquiry_content, inquiry_date "
				+ "from (select t1.*, rownum r "
				+ "from (select i.inquiry_title, i.inquiry_content, i.inquiry_date "
				+ "from tb_inquiry i join tb_member m on i.member_no = m.member_no where member_id = ?)t1)t2 "
				+ "where r between ? and ? order by r desc";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(3, endRnum);
			pstmt.setInt(2, startRnum);		
			rs = pstmt.executeQuery();
			if(rs != null) {
				volist = new ArrayList<InquiryVo>();
				while(rs.next()) {
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
	
	public InquiryVo readinquiry(Connection conn, String memberId, String inquiryTitle) {
		InquiryVo ivo = null;
		sql="select * from tb_inquiry i join tb_member m on i.member_no = m.member_no where member_id= ? and inquiry_title= ? ";	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, inquiryTitle);
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
	
	public int insertInquiry(Connection conn, int memberNo, String inqTitle, String inqContent) {
		int result = 0;
		sql="insert into tb_inquiry (inquiry_no, member_no, inquiry_title, inquiry_content, inquiry_date, inquiry_check)"
				+ " values ((select nvl(max(inquiry_no),0)+1 from tb_inquiry), ?, ?, ?, sysdate, default)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, inqTitle);
			pstmt.setString(3, inqContent);
			rs = pstmt.executeQuery();
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
		sql="select count(*) as cnt from tb_inquiry join tb_member on tb_inquiry.member_no = tb_member.member_no where member_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
	
}
