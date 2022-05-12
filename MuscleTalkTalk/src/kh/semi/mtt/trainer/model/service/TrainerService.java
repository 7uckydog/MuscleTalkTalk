package kh.semi.mtt.trainer.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.member.model.vo.TrainerVo;
import kh.semi.mtt.trainer.model.dao.TrainerDao;

public class TrainerService {
	private TrainerDao dao = new TrainerDao();
	
	// 트레이너용 회원가입
	public int insertTrainer(MemberVo vo, TrainerVo tvo) {
		int result = 0;
		Connection conn =null;
		conn = getConnection();
		
		result = new TrainerDao().insertTrainer(conn, vo, tvo);
		close(conn);
		return result;
	}
	
	//트레이너 전체보기 (진정)
	public ArrayList<TrainerVo> readAllTrainer(int startRnum, int endRnum, String search){
		Connection conn =null;
		conn = getConnection();
		ArrayList<TrainerVo> result = new TrainerDao().readAllTrainer(conn, startRnum, endRnum, search);
		close(conn);
		return result;
	}
	
	public int countTrainer() {
		Connection conn = null;
		conn = getConnection();
		int result = dao.countTrainer(conn);
		close(conn);
		return result;
	}
}
