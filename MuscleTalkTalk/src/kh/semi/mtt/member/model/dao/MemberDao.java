package kh.semi.mtt.member.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kh.semi.mtt.member.model.vo.MemberVo;

public class MemberDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public MemberVo readOneMember(Connection conn, String memberId) {
		MemberVo retVo = null;
		String sql = "select * from tb_member where member_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			System.out.println("memberId:" + memberId);
			System.out.println("rs First: " + rs);
			if (rs != null) {
				rs.next();
				System.out.println("rs Second: " + rs);
				retVo = new MemberVo();
				System.out.println("retVo: " + retVo);
				retVo.setMemberId(rs.getString("member_id"));
				retVo.setMemberPassword(rs.getString("member_password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return retVo;
	}
	
	public MemberVo login(Connection conn, String memeberId, String memberPassword) {
		MemberVo retVo = null;
		String sql = "select * from tb_member where member_id = ? and member_password = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memeberId);
			pstmt.setString(2, memberPassword);
			rs = pstmt.executeQuery();
			
			if(rs!=null) {
				if(rs.next()) {
					retVo = new MemberVo();
					retVo.setMemberId(rs.getString("member_id"));
					retVo.setMemberPassword(rs.getString("member_password"));
					retVo.setMemberNickname(rs.getString("member_nickname"));
					retVo.setMemberEmail(rs.getString("member_email"));
					retVo.setMemberName(rs.getString("member_name"));
					retVo.setMemberPhone(rs.getString("member_phone"));
					retVo.setMemberGender(rs.getString("member_gender"));
					retVo.setMemberAge(rs.getString("member_age"));
					retVo.setMemberHeight(rs.getString("member_height"));
					retVo.setMemberWeight(rs.getString("member_weight"));
					retVo.setMemberPurpose(rs.getString("member_purpose"));
					retVo.setMemberConcern(rs.getString("member_concern"));
					retVo.setMemberPhoto(rs.getString("member_photo"));
					retVo.setMemberTrainer(rs.getString("member_trainer"));
					retVo.setMemberAbsence(rs.getString("member_absence"));
					retVo.setMemberJoinDate(rs.getString("member_join_date"));
					retVo.setMemberLeaveDate(rs.getString("member_leave_date"));
				}
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return retVo;
	}
	
	public MemberVo findIdfromNameAndEmail(Connection conn, String memberName, String memberEmail) {
		MemberVo retVo = null;
		String sql = "select * from tb_member where member_name = ? and member_email = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberEmail);
			rs = pstmt.executeQuery();
			System.out.println("service- name:" + memberName);
			if(rs!=null) {
				if(rs.next()) {
					retVo = new MemberVo();
					retVo.setMemberEmail(rs.getString("member_email"));
					retVo.setMemberName(rs.getString("member_name"));
				}
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return retVo;
	}
	
	
}
