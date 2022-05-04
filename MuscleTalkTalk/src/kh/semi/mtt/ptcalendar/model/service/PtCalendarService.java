package kh.semi.mtt.ptcalendar.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;
import kh.semi.mtt.ptcalendar.model.dao.PtCalendarDao;
import kh.semi.mtt.ptcalendar.model.vo.PtCalendarVo;

public class PtCalendarService {
	private PtCalendarDao dao = new PtCalendarDao();
	
	public ArrayList<PtCalendarVo> readAllReservation(int ptNo) {
		ArrayList<PtCalendarVo> ptCalList = null;
		Connection conn = null;
		conn = getConnection();
		
		ptCalList = dao.readAllReservation(conn, ptNo);
		System.out.println("PtCalendarService readAllReservation()매소드 결과: " + ptCalList);
		
		close(conn);
		return ptCalList;
	}
}
