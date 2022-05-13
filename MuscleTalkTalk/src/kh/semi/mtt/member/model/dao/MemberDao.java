package kh.semi.mtt.member.model.dao;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kh.semi.mtt.member.model.vo.AdminVo;
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
	
	public MemberVo readTrainerMember(Connection conn, int trainerNo) {
		MemberVo retVo = null;
		String sql = "select * from tb_member a, tb_trainer b where a.member_no = b.member_no(+) and b.trainer_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainerNo);
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
				retVo.setTrainerConfirm(rs.getString("trainer_confirm"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return retVo;
	}
	
	public MemberVo readOneMember(Connection conn, int memberNo) {
		MemberVo retVo = null;
		String sql = "select * from tb_member a, tb_trainer b where a.member_no = b.member_no(+) and a.member_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
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
		String sql = "update tb_member set member_nickname = ?, member_email = ?, member_phone = ?, member_age = ?, member_height = ?, member_weight = ?, member_purpose = ?, member_concern = ?, member_photo=? where member_id = ?";
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
			pstmt.setString(9, vo.getMemberPhoto());
			pstmt.setString(10, vo.getMemberId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// 회원 정보 수정2 (사진x)- 업데이트
		public int updateMember2(Connection conn, MemberVo vo) {
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
	
	// 회원 탈퇴
		public int withdrawal(Connection conn, String memberId, String memberPassword) {
			int result = -1;
			System.out.println(memberId);
			String sql = "update tb_member set member_absence = 'Y', member_leave_date = sysdate where member_id= ? and member_password= ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberPassword);
				
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return result;
		}
		
	//멤버 전체조회 (진정)
		public ArrayList<AdminVo> readAllMember(Connection conn, int startRnum, int endRnum, String search, int filterint){
			ArrayList<AdminVo> volist = null;
			String sql = "select * from "
					+ "    (select rownum r, tall.* from "
					+ "        (select tm.member_name, tm.member_no, tm.MEMBER_JOIN_DATE, nvl(price_sum,0) sum_price, nvl(b_report_count,0) b_report_cnt, nvl(rb_report_count,0) rb_report_cnt "
					+ "					    from tb_member tm"
					+ "					    left outer join (select member_no, sum(PAYMENT_PRICE) price_sum"
					+ "					        from tb_payment "
					+ "					        group by MEMBER_NO ) t3"
					+ "					    on tm.member_no = t3.member_no"
					+ "					    left outer join (select tb.member_no, count(tb.member_no) b_report_count"
					+ "					        from tb_board_report tbr"
					+ "					        join tb_board tb"
					+ "					        on tbr.board_no = tb.board_no"
					+ "					        group by tb.member_no) t1"
					+ "					    on tm.member_no = t1.member_no"
					+ "					    left outer join (select trb.member_no, count(trb.member_no) rb_report_count"
					+ "					        from tb_board_report tbr"
					+ "					        join tb_routine_board trb"
					+ "					        on tbr.routine_board_no = trb.routine_board_no"
					+ "					        group by trb.member_no) t2"
					+ "					    on tm.member_no = t2.member_no"
					+ "                        order by member_no asc)tall"
					+ "                    ) where r between ? and ? order by r desc";
			
			if(filterint == 1) {
				sql = "select * from "
						+ "    (select rownum r, tall.* from "
						+ "        (select tm.member_name, tm.member_no, tm.MEMBER_JOIN_DATE, nvl(price_sum,0) sum_price, nvl(b_report_count,0) b_report_cnt, nvl(rb_report_count,0) rb_report_cnt "
						+ "					    from tb_member tm"
						+ "					    left outer join (select member_no, sum(PAYMENT_PRICE) price_sum"
						+ "					        from tb_payment "
						+ "					        group by MEMBER_NO ) t3"
						+ "					    on tm.member_no = t3.member_no"
						+ "					    left outer join (select tb.member_no, count(tb.member_no) b_report_count"
						+ "					        from tb_board_report tbr"
						+ "					        join tb_board tb"
						+ "					        on tbr.board_no = tb.board_no"
						+ "					        group by tb.member_no) t1"
						+ "					    on tm.member_no = t1.member_no"
						+ "					    left outer join (select trb.member_no, count(trb.member_no) rb_report_count"
						+ "					        from tb_board_report tbr"
						+ "					        join tb_routine_board trb"
						+ "					        on tbr.routine_board_no = trb.routine_board_no"
						+ "					        group by trb.member_no) t2"
						+ "					    on tm.member_no = t2.member_no"
						+ "                        order by member_no asc)tall"
						+ "                    ) where r between ? and ? order by r desc";
			} else if(filterint == 2) {
				sql = "select * from "
						+ "    (select rownum r, tall.* from "
						+ "        (select tm.member_name, tm.member_no, tm.MEMBER_JOIN_DATE, nvl(price_sum,0) sum_price, nvl(b_report_count,0) b_report_cnt, nvl(rb_report_count,0) rb_report_cnt "
						+ "					    from tb_member tm"
						+ "					    left outer join (select member_no, sum(PAYMENT_PRICE) price_sum"
						+ "					        from tb_payment "
						+ "					        group by MEMBER_NO ) t3"
						+ "					    on tm.member_no = t3.member_no"
						+ "					    left outer join (select tb.member_no, count(tb.member_no) b_report_count"
						+ "					        from tb_board_report tbr"
						+ "					        join tb_board tb"
						+ "					        on tbr.board_no = tb.board_no"
						+ "					        group by tb.member_no) t1"
						+ "					    on tm.member_no = t1.member_no"
						+ "					    left outer join (select trb.member_no, count(trb.member_no) rb_report_count"
						+ "					        from tb_board_report tbr"
						+ "					        join tb_routine_board trb"
						+ "					        on tbr.routine_board_no = trb.routine_board_no"
						+ "					        group by trb.member_no) t2"
						+ "					    on tm.member_no = t2.member_no"
						+ "                        order by sum_price asc)tall"
						+ "                    ) where r between ? and ? order by r desc";
			}
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRnum);
				pstmt.setInt(2, endRnum);
				
				rs = pstmt.executeQuery();
				if(rs != null) {
					volist = new ArrayList<AdminVo>();
					while (rs.next()) {
						AdminVo vo = new AdminVo();
						vo.setMemberName(rs.getString("member_name"));
						vo.setMemberNo(rs.getInt("member_no"));
						vo.setMemberJoinDate(rs.getDate("member_join_date"));
						vo.setSumPrice(rs.getInt("sum_price"));
						vo.setBoardReportCnt(rs.getInt("b_report_cnt") + rs.getInt("rb_report_cnt"));
						vo.setRownum(rs.getInt("r"));
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

		public int countMember(Connection conn) {
			int result = 0;
			String sql = "select count(*) as cnt from tb_member";
			
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
		///트레이너인증 - tb_member
		public int confirmMember(Connection conn, int memberNo) {
			int result = 0;
			String sql = "update tb_member set member_trainer = 'T' where member_no = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, memberNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return result;
		}
		///트레이너인증 - tb_trainer
		public int confirmTrainer(Connection conn, int memberNo) {
			int result = 0;
			String sql = "update tb_trainer set trainer_confirm = 'T' where member_no = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, memberNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return result;
		}
		///트레이너반려 - tb_member
		public int rejectMember(Connection conn, int memberNo) {
			int result = 0;
			String sql = "update tb_member set member_trainer = 'F' where member_no = ? ";
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, memberNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return result;
		}
		///트레이너반려 - tb_trainer
		public int rejectTrainer(Connection conn, int memberNo) {
			int result = 0;
			String sql = "update tb_trainer set trainer_confirm = 'F' where member_no = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, memberNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return result;
		}
		
		//dashboard 숫자세기 (진정)
		public ArrayList<AdminVo> dashboardMember(Connection conn){
			ArrayList<AdminVo> volist = null;
			String sql = "select count(*) dcnt, sysdate Dateval from tb_member where member_join_date <= sysdate"
					+ "    union select count(*) dcnt, sysdate-1 Dateval from tb_member where member_join_date <= sysdate - 1"
					+ "    union select count(*) dcnt, sysdate-2 Dateval from tb_member where member_join_date <= sysdate - 2"
					+ "    union select count(*) dcnt, sysdate-3 Dateval from tb_member where member_join_date <= sysdate - 3"
					+ "    union select count(*) dcnt, sysdate-4 Dateval from tb_member where member_join_date <= sysdate - 4"
					+ "    union select count(*) dcnt, sysdate-5 Dateval from tb_member where member_join_date <= sysdate - 5"
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
