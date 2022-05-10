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
	
	public ArrayList<BlackistVo> readBlacklist(int trainerNo, int startRnum, int endRnum) {
		ArrayList<BlackistVo> result = null;
		
		Connection conn = null;
		conn = getConnection();
		
		result = dao.readBlacklist(conn, trainerNo, startRnum, endRnum);
		
		close(conn);
		return result;
	}
	
	public int readOneBlacklist(int trainerNo, int memberNo) {
		int result = -1;
		
		Connection conn = null;
		conn = getConnection();
		
		result = dao.readOneBlacklist(conn, trainerNo, memberNo);
		
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
	
	public int countBlacklist(int trainerNo) {
		int result = 0;
		
		Connection conn = null;
		conn = getConnection();
		
		result = dao.countBlacklist(conn, trainerNo);
		
		close(conn);
		return result;
	}
	
	public ArrayList<Integer> blacklistMember(int ptNo) {
		ArrayList<Integer> result = null;
		
		Connection conn = null;
		conn = getConnection();
		
		result = dao.blacklistMember(conn, ptNo);
		
		close(conn);
		return result;
	}
}
