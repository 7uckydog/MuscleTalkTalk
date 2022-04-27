package kh.semi.mtt.trainer.model.service;

import java.sql.Connection;
import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.member.model.vo.TrainerVo;
import kh.semi.mtt.trainer.model.dao.TrainerDao;

public class TrainerService {
	// 트레이너용 회원가입
	public int insertTrainer(MemberVo vo, TrainerVo tvo) {
		int result = 0;
		Connection conn =null;
		conn = getConnection();
		
		result = new TrainerDao().insertTrainer(conn, vo, tvo);
		close(conn);
		return result;
	}
}
