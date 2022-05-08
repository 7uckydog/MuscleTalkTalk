package kh.semi.mtt.ptfavorite.model.service;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;
import static kh.semi.mtt.common.jdbc.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.mtt.ptfavorite.model.dao.PtFavoriteDao;
import kh.semi.mtt.ptfavorite.model.vo.PtFavoriteVo;

public class PtFavoriteService {
	private PtFavoriteDao dao = new PtFavoriteDao();
	
	public int insertPtFavorite(int memberNo, int ptNo) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.insertPtFavorite(conn, memberNo, ptNo);
		
		close(conn);
		return result;
	}
	
	public int deletePtFavorite(int memberNo, int ptNo) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.deletePtFavorite(conn, memberNo, ptNo);
		
		close(conn);
		return result;
	}
	
	public ArrayList<PtFavoriteVo> readAllPtFavorite(int memberNo) {
		ArrayList<PtFavoriteVo> result = null;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.readAllPtFavorite(conn, memberNo);
		
		close(conn);
		return result;
	}
	
}
