package kh.semi.mtt.trainer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;
import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.member.model.vo.TrainerVo;

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



