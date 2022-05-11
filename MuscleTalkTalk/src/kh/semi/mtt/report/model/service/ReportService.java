package kh.semi.mtt.report.model.service;

import java.sql.Connection;


import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;
import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.report.model.dao.ReportDao;
import kh.semi.mtt.report.model.vo.ReportVo;

public class ReportService {
	ReportDao dao = new ReportDao();
	
	public int insertReport(ReportVo rpvo, MemberVo mvo){
		Connection conn = null;
		conn = getConnection();
		
		int result = dao.insertReport(conn, rpvo, mvo);
		close(conn);
		
		return result;
	}
}
