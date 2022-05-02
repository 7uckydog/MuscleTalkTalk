package kh.semi.mtt.member.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.member.model.vo.TrainerVo;

public class MemberDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public MemberVo readOneMember(Connection conn, String memberId) {
		MemberVo retVo = null;
		String sql = "select * from tb_member a, tb_trainer b where a.member_no = b.member_no(+) and member_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs != null) {
				rs.next();
				retVo = new MemberVo();
				retVo.setMemberNo(rs.getInt("member_no"));
				retVo.setMemberId(rs.getString("member_id"));
				retVo.setMemberPassword(rs.getString("member_password"));
				retVo.setMemberNickname(rs.getString("member_nickname"));
				retVo.setMemberEmail(rs.getString("member_email"));
				retVo.setMemberName(rs.getString("member_name"));
				retVo.setMemberPhone(rs.getString("member_phone"));
				retVo.setMemberGender(rs.getString("member_gender"));
				retVo.setMemberAge(rs.getInt("member_age"));
				retVo.setMemberHeight(rs.getInt("member_height"));
				retVo.setMemberWeight(rs.getInt("member_weight"));
				retVo.setMemberPurpose(rs.getInt("member_purpose"));
				retVo.setMemberConcern(rs.getInt("member_concern"));
				retVo.setMemberPhoto(rs.getString("member_photo"));
				retVo.setMemberTrainer(rs.getString("member_trainer"));
				retVo.setMemberAbsence(rs.getString("member_absence"));
				retVo.setMemberJoinDate(rs.getDate("member_join_date"));
				retVo.setMemberLeaveDate(rs.getDate("member_leave_date"));
				retVo.setTrainerNo(rs.getInt("trainer_no"));
				retVo.setTrainerFile(rs.getString("trainer_file"));
				retVo.setGymName(rs.getString("gym_name"));
				retVo.setGymLocation(rs.getString("gym_location"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return retVo;
	}
	
	// 회원 로그인용
	public MemberVo login(Connection conn, String memeberId, String memberPassword) {
		MemberVo retVo = null;
		String sql = "select * from tb_member a, tb_trainer b where a.member_no = b.member_no(+) and member_id = ? and member_password = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memeberId);
			pstmt.setString(2, memberPassword);
			rs = pstmt.executeQuery();
			
			if(rs!=null) {
				if(rs.next()) {
					retVo = new MemberVo();
					retVo.setMemberNo(rs.getInt("member_no"));
					retVo.setMemberId(rs.getString("member_id"));
					retVo.setMemberPassword(rs.getString("member_password"));
					retVo.setMemberNickname(rs.getString("member_nickname"));
					retVo.setMemberEmail(rs.getString("member_email"));
					retVo.setMemberName(rs.getString("member_name"));
					retVo.setMemberPhone(rs.getString("member_phone"));
					retVo.setMemberGender(rs.getString("member_gender"));
					retVo.setMemberAge(rs.getInt("member_age"));
					retVo.setMemberHeight(rs.getInt("member_height"));
					retVo.setMemberWeight(rs.getInt("member_weight"));
					retVo.setMemberPurpose(rs.getInt("member_purpose"));
					retVo.setMemberConcern(rs.getInt("member_concern"));
					retVo.setMemberPhoto(rs.getString("member_photo"));
					retVo.setMemberTrainer(rs.getString("member_trainer"));
					retVo.setMemberAbsence(rs.getString("member_absence"));
					retVo.setMemberJoinDate(rs.getDate("member_join_date"));
					retVo.setMemberLeaveDate(rs.getDate("member_leave_date"));
					retVo.setTrainerNo(rs.getInt("trainer_no"));
					retVo.setTrainerFile(rs.getString("trainer_file"));
					retVo.setGymName(rs.getString("gym_name"));
					retVo.setGymLocation(rs.getString("gym_location"));
					
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
			if(rs!=null) {
				if(rs.next()) {
					retVo = new MemberVo();
					retVo.setMemberEmail(rs.getString("member_email"));
					retVo.setMemberName(rs.getString("member_name"));
					retVo.setMemberId(rs.getString("member_Id"));
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
	
	public MemberVo findPwdfromIdAndNameAndEmail(Connection conn, String memberId, String memberName, String memberEmail) {
		MemberVo retVo = null;
		String sql = "select * from tb_member where member_name = ? and member_email = ? and member_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberEmail);
			pstmt.setString(3, memberId);
			rs = pstmt.executeQuery();
			if(rs!=null) {
				if(rs.next()) {
					retVo = new MemberVo();
					retVo.setMemberEmail(rs.getString("member_email"));
					retVo.setMemberName(rs.getString("member_name"));
					retVo.setMemberId(rs.getString("member_Id"));
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
	
	// 아아디 중복 확인용
	public int idCheck(Connection conn, String memberId) {
		int result = 0;
		String sql = "select count(*) from tb_member where member_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// 닉네임 중복 확인용
	public int nicknameCheck(Connection conn, String memberNickname) {
		int result = 0;
		String sql = "select count(*) from tb_member where member_nickname = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberNickname);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// 이메일 중복 확인용
	public int emailCheck(Connection conn, String memberEmail) {
		int result = 0;
		String sql = "select count(*) from tb_member where member_email = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
				System.out.println("dao:" + result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// 일반회원용 회원가입
	public int insertMember(Connection conn, MemberVo vo) {
		int result = 0;
		String sql = "insert into tb_member (member_no, member_id, member_password, member_nickname, member_email, member_name, member_phone, "
				+ "member_gender, member_age, member_height, member_weight, member_purpose, member_concern, member_trainer, "
				+ "member_absence, member_join_date) values((select nvl(max(member_no),0)+1 from tb_member), "
				+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default, default)";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getMemberId());
			pstmt.setString(2, vo.getMemberPassword());
			pstmt.setString(3, vo.getMemberNickname());
			pstmt.setString(4, vo.getMemberEmail());
			pstmt.setString(5, vo.getMemberName());
			pstmt.setString(6, vo.getMemberPhone());
			pstmt.setString(7, vo.getMemberGender());
			pstmt.setInt(8, vo.getMemberAge());
			pstmt.setInt(9, vo.getMemberHeight());
			pstmt.setInt(10, vo.getMemberWeight());
			pstmt.setInt(11, vo.getMemberPurpose());
			pstmt.setInt(12, vo.getMemberConcern());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 회원 정보 수정 - 업데이트
	public int updateMember(Connection conn, MemberVo vo) {
		int result = 0;
		String sql = "update tb_member set member_nickname = ?, member_email = ?, member_phone = ?, member_age = ?, member_height = ?, member_weight = ?, member_purpose = ?, member_concern = ? where member_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getMemberNickname());
			pstmt.setString(2, vo.getMemberEmail());
			pstmt.setString(3, vo.getMemberPhone());
			pstmt.setInt(4, vo.getMemberAge());
			pstmt.setInt(5, vo.getMemberHeight());
			pstmt.setInt(6, vo.getMemberWeight());
			pstmt.setInt(7, vo.getMemberPurpose());
			pstmt.setInt(8, vo.getMemberConcern());
			pstmt.setString(9, vo.getMemberId());
			
			System.out.println("업데이트 전 updateMemberDao" + vo.getMemberId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// 비밀번호 수정 - 업데이트
		public int updatePassword(Connection conn, String memberId, String memberPassword, String memberNewPassword) {
			int result = 0;
			String sql = "update tb_member set member_password = ? where member_id =? and member_password = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, memberNewPassword);
				pstmt.setString(2, memberId);
				pstmt.setString(3, memberPassword);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return result;
		}
	
	
	
}
