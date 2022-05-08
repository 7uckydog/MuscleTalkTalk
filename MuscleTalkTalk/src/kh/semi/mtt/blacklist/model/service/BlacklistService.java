package kh.semi.mtt.blacklist.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.mtt.blacklist.model.dao.BlacklistDao;
import kh.semi.mtt.blacklist.model.vo.BlackistVo;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

public class BlacklistService {
	private BlacklistDao dao = new BlacklistDao();
	
	public int insertBlacklist(int trainerNo, int memberNo) {
		int result = 0;
		
		Connection conn = null;
		conn = getConnection();
		
		result = dao.insertBlacklist(conn, trainerNo, memberNo);
		
		close(conn);
		return result;
	}
	
	public ArrayList<BlackistVo> readBlacklist(int trainerNo) {
		ArrayList<BlackistVo> result = null;
		
		Connection conn = null;
		conn = getConnection();
		
		result = dao.readBlacklist(conn, trainerNo);
		
		close(conn);
		return result;
	}
	
	public int deleteBlacklist(int blacklistNo) {
		int result = 0;
		
		Connection conn = null;
		conn = getConnection();
		
		result = dao.deleteBlacklist(conn, blacklistNo);
		
		close(conn);
		return result;
	}
	
}
