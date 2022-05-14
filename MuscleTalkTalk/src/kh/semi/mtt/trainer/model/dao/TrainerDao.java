package kh.semi.mtt.trainer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;
import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.member.model.vo.TrainerVo;
import kh.semi.mtt.member.model.vo.TestTempVo;

public class TrainerDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 트레이너용 회원가입
	public int insertTrainer(Connection conn, MemberVo vo, TrainerVo tvo) {
		int result = 0;
		sql = "insert all into tb_member (member_no, member_id, member_password, member_nickname, member_email, member_name, member_phone, "
				+ "member_gender, member_age, member_height, member_weight, member_purpose, member_concern, member_trainer, "
				+ "member_absence, member_join_date) "
				+ "values((select nvl(max(member_no),0)+1 from tb_member), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'R', default, default) "
				+ "into tb_trainer (trainer_no, member_no, trainer_file, trainer_confirm, gym_name, gym_location) "
				+ "values((select nvl(max(trainer_no),0)+1 from tb_trainer), (select nvl(max(member_no),0)+1 from tb_member), ?, default, ?, ?) "
				+ "select * from dual";
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
			pstmt.setString(13, tvo.getTrainerFile());
			pstmt.setString(14, tvo.getGymName());
			pstmt.setString(15, tvo.getGymLocation());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 회원 -> 트레이너 전환
	public int switchAccount(Connection conn, int memberNo, String gymName, String gymLocation, String trainerFile) {
		int result = -1;
		sql = "insert into tb_trainer (trainer_no, member_no, trainer_file, trainer_confirm, gym_name, gym_location, trainer_etr)"
				+ "values( (select nvl(max(trainer_no),0)+1 from tb_trainer), ?, ?, default, ?, ?, null)";
		String sql2 = "update tb_member set member_trainer = 'R'"
				+ "where member_no= ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, trainerFile);
			pstmt.setString(3, gymName);
			pstmt.setString(4, gymLocation);
			
			result = pstmt.executeUpdate();
			close(pstmt);
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, memberNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 트레이너 탈퇴
	public TestTempVo deleteTrainer(Connection conn, int memberNo) {
		System.out.println("dao 하러 왔습니다.");
		System.out.println(memberNo);
		TestTempVo ttvo = null;
		int result = -1;
		int ptNo = -1;
		int number = -1;
		TrainerVo retVo = null;
		
		String sql = "select trainer_no from tb_trainer t join tb_member m on t.member_no = m.member_no where t.member_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			System.out.println("dao1 : " + memberNo);
			
			if(rs.next()) {
				retVo = new TrainerVo();
				retVo.setTrainerNo(rs.getInt("trainer_no"));
				System.out.println("트레이너 번호는 뭘까요? 피피카츄!: " + retVo.getTrainerNo());
				close(rs);
				close(pstmt);
			}
			
			// 예약된 프로그램이 있는지 확인
			String sql2 ="select p.pt_no from tb_pt_calendar c inner join tb_pt p on c.pt_no = p.pt_no"
					+ " join tb_trainer t on p.trainer_no = t.trainer_no"
					+ " where t.trainer_no = ? and pt_calendar_reservation_state='T'";
			try {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, retVo.getTrainerNo());
				rs = pstmt.executeQuery();
				if(rs.next() == true) {
					// 예약한 프로그램이 있다면
								retVo.setPtNo(rs.getInt("pt_no"));
								System.out.println("ㅆㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ" + retVo.getPtNo());
								close(rs);
								close(pstmt);
								
								String sql3 = "update tb_trainer set trainer_etr = 'I' where trainer_no = ?";
								try {
									pstmt = conn.prepareStatement(sql3);
									pstmt.setInt(1, retVo.getTrainerNo());
									result = pstmt.executeUpdate();
									System.out.println("sql3의 결과값: " + result);
									close(pstmt);
									
									String sql4 = "update tb_pt set pt_delete = 'T' where trainer_no = ?";
									pstmt = conn.prepareStatement(sql4);
									pstmt.setInt(1, retVo.getTrainerNo());
									result = pstmt.executeUpdate();
									System.out.println("sql4의 결과값: " + result);
									close(pstmt);
									
									number = 1;
									
									ttvo = new TestTempVo();
									ttvo.setResult(result);
									ttvo.setNum(number);
									System.out.println("기분 거지같네"+ttvo.getNum());
								} catch (Exception e) {
									e.printStackTrace();
								}
				} else if(rs.next() == false){
					// 바로 탈퇴
					String sql5 = "update tb_trainer set trainer_etr = 'Q' where trainer_no = ?";
					
					pstmt = conn.prepareStatement(sql5);
					pstmt.setInt(1, retVo.getTrainerNo());
					result = pstmt.executeUpdate();
					System.out.println("sql5의 결과값: " + result);
					close(pstmt);
					
					String sql6 = "update tb_member set member_absence = 'Y' where member_no = ?";
					pstmt = conn.prepareStatement(sql6);
					pstmt.setInt(1, memberNo);
					result = pstmt.executeUpdate();
					System.out.println("sql6의 결과값: " + result);
					close(pstmt);
					
					number = 2;
					
					ttvo = new TestTempVo();
					ttvo.setResult(result);
					ttvo.setNum(number);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return ttvo;
	}
	
	
	//트레이너 전체보기 (진정)
	public ArrayList<TrainerVo> readAllTrainer(Connection conn, int startRnum, int endRnum, String search){
		ArrayList<TrainerVo> volist = null;
		String sql = "select * from"
				+ "    (select rownum r, t.* "
				+ "        from (select tm.member_nickname, ttr.trainer_no, tm.member_join_date, sum(payment_price) sum_price, ttr.trainer_confirm"
				+ "            from tb_payment tp"
				+ "            right outer join tb_pt_calendar tpc on tp.pt_calendar_no = tpc.pt_calendar_no"
				+ "            right outer join tb_pt tpp on tpc.pt_no = tpp.pt_no"
				+ "            right outer join tb_trainer ttr on tpp.trainer_no = ttr.trainer_no"
				+ "            join tb_member tm on ttr.member_no = tm.member_no"
				+ "            group by ttr.trainer_no, ttr.member_no, tm.member_nickname, tm.member_join_date, ttr.trainer_confirm"
				+ "            order by tm.member_join_date desc)t"
				+ "        order by r desc)"
				+ "    where r between ? and ?";
		
		try {
			System.out.println("startRnum :" + startRnum);
			System.out.println("endRnum :" + endRnum);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
			
			rs = pstmt.executeQuery();
			if(rs != null) {
				volist = new ArrayList<TrainerVo>();
				while(rs.next()) {
					TrainerVo vo = new TrainerVo();
					vo.setTrainerNo(rs.getInt("trainer_no"));
					vo.setMemberNickname(rs.getString("member_nickname"));
					vo.setSumPrice(rs.getInt("sum_price"));
					vo.setMemberJoinDate(rs.getDate("member_join_date"));
					vo.setRownum(rs.getInt("r"));
					vo.setTrainerConfirm(rs.getString("trainer_confirm"));
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
	
	public int countTrainer(Connection conn) {
		int result = 0;
		String sql = "select count(*) as cnt from tb_trainer";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
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



