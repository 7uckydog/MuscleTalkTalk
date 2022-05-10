package kh.semi.mtt.pt.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.getConnection;
import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;
import kh.semi.mtt.pt.model.dao.PtDao;
import kh.semi.mtt.pt.model.vo.PtVo;

public class PtService {
	private PtDao dao = new PtDao();
	
	public int myPt(int trainerNo, int ptNo) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.myPt(conn, trainerNo, ptNo);
		
		close(conn);
		return result;
	}
	public int countPt() {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.countPt(conn);
		
		close(conn);
		return result;
	}
	
	public int countPt(int trainerNo) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.countPt(conn, trainerNo);
		
		close(conn);
		return result;
	}
	
	public int countPtFavorite(int memberNo) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.countPtFavorite(conn, memberNo);
		System.out.println("PtService countPtFavorite() result : " + result);
		close(conn);
		return result;
	}
	
	public int insertPt(PtVo ptVo) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.insertPt(conn, ptVo);
		
		close(conn);
		return result;
	}
	
	public PtVo readPt(int ptNo) {
		PtVo result = null;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.readPt(conn, ptNo);
		System.out.println("PtService readPt()매소드 결과:  " + result);
		close(conn);
		return result;
	}
	
	public ArrayList<PtVo> readAllFavoritePt(int startRnum, int endRnum, int memberNo) {
		ArrayList<PtVo> result = null;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.readAllFavoritePt(conn, startRnum, endRnum, memberNo);
		System.out.println("PtService readAllFavoritePt()매소드 결과:  " + result);
		close(conn);
		return result;
	}
	
	public ArrayList<PtVo> readAllPt(int startRnum, int endRnum) {
		ArrayList<PtVo> result = null;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.readAllPt(conn, startRnum, endRnum);
		System.out.println("PtService readAllPt()매소드 결과:  " + result);
		close(conn);
		return result;
	}
	
	public ArrayList<PtVo> readMyPt(int trainerNo, int startRnum, int endRnum) {
		ArrayList<PtVo> result = null;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.readMyPt(conn, trainerNo, startRnum, endRnum);
		System.out.println("PtService readMyPt()매소드 결과:  " + result);
		close(conn);
		return result;
	}
	

}
