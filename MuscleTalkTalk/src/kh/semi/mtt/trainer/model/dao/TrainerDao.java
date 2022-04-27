package kh.semi.mtt.trainer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
				+ "values((select nvl(max(member_no),0)+1 from tb_member), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default, default) "
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
			System.out.println("여기는 트레이너 회원가입 dao다 오바~");
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
