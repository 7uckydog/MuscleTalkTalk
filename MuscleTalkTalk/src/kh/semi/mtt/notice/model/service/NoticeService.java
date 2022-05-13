package kh.semi.mtt.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.mtt.notice.model.dao.NoticeDao;
import kh.semi.mtt.notice.model.vo.NoticeVo;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.*;

public class NoticeService {
	private NoticeDao dao = new NoticeDao();
	
	public int insertNotice(NoticeVo vo) {
		Connection conn = null;
		conn = getConnection();
		int result = dao.insertNotice(conn, vo);
		return result;
		
	}
	
	public NoticeVo readNotice(int noticeNo) {
		Connection conn=null;
		conn = getConnection();
		NoticeVo vo = dao.readNotice(conn, noticeNo);
//		vo.setReCommentList(dao.readNotice(conn, noticeNo));
		close(conn);
		return vo;
	}
	
	public ArrayList<NoticeVo> readAllNotice(int startRnum, int endRnum, String search){   //오버로딩
		Connection conn=null;
		conn = getConnection();
		ArrayList<NoticeVo> result = dao.readAllNotice(conn, startRnum, endRnum, search);
		close(conn);
		return result;
	}

	public int countNotice() {
		Connection conn=null;
		conn = getConnection();
		int result = dao.countNotice(conn);
		close(conn);
		return result;
	}
	
	public int updateNotice(NoticeVo vo) {
		Connection conn=null;
		conn = getConnection();
		int result = dao.updateNotice(conn, vo);
		close(conn);
		return result;
	}
	
	public int deleteNotice(int noticeNo) {
		Connection conn=null;
		conn = getConnection();
		int result = dao.deleteNotice(conn, noticeNo);
		close(conn);
		return result;
	}
	
	public ArrayList<NoticeVo> mainNotice(){   
		Connection conn=null;
		conn = getConnection();
		ArrayList<NoticeVo> result = dao.mainNotice(conn);
		close(conn);
		return result;
	}
}
