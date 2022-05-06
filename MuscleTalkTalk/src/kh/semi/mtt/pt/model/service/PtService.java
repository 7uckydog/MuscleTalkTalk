package kh.semi.mtt.pt.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.getConnection;
import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;
import kh.semi.mtt.pt.model.dao.PtDao;
import kh.semi.mtt.pt.model.vo.PtVo;

public class PtService {
	private PtDao dao = new PtDao();
	
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
	
	public ArrayList<PtVo> readAllPt() {
		ArrayList<PtVo> result = null;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.readAllPt(conn);
		System.out.println("PtService readAllPt()매소드 결과:  " + result);
		close(conn);
		return result;
	}
	
	public ArrayList<PtVo> readMyPt(int trainerNo) {
		ArrayList<PtVo> result = null;
		Connection conn = null;
		conn = getConnection();
		
		result = dao.readMyPt(conn, trainerNo);
		System.out.println("PtService readAllPt()매소드 결과:  " + result);
		close(conn);
		return result;
	}
	

}
