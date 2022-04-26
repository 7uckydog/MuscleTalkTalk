package kh.semi.mtt.member.model.service;

import java.sql.Connection;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;
import static kh.semi.mtt.common.jdbc.JdbcTemplate.getConnection;

import kh.semi.mtt.member.model.dao.MemberDao;
import kh.semi.mtt.member.model.vo.MemberVo;

public class MemberService {
	private MemberDao dao = new MemberDao();
	
	public MemberVo readOneMember(String memberId) {
		MemberVo retVo = null;
		Connection conn = getConnection();
		retVo = dao.readOneMember(conn, memberId);
		close(conn);
		return retVo;
	}
	
	public MemberVo login(String memeberId, String memberPassword) {
		MemberVo retVo = null;
		Connection conn = null;
		conn = getConnection();
		retVo = dao.login(conn, memeberId, memberPassword);
		close(conn);
		return retVo;
	}
	
	public MemberVo findIdfromNameAndEmail(String memberName, String memberEmail) {
		MemberVo retVo = null;
		Connection conn = null;
		conn = getConnection();
		retVo = dao.findIdfromNameAndEmail(conn, memberName, memberEmail);
		close(conn);
		return retVo;
	}
	
	public MemberVo findPwdfromIdAndNameAndEmail(String memberId, String memberName, String memberEmail) {
		MemberVo retVo = null;
		Connection conn = null;
		conn = getConnection();
		retVo = dao.findPwdfromIdAndNameAndEmail(conn, memberId, memberName, memberEmail);
		close(conn);
		return retVo;
	}
	
	// 아이디 중복 체크용
	public int idCheck(String memberId) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		
		result = new MemberDao().idCheck(conn, memberId);
		close(conn);
		return result;
	}
	
	// 닉네임 중복 체크용
	public int nicknameCheck(String memberNickname) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
			
		result = new MemberDao().nicknameCheck(conn, memberNickname);
		close(conn);
		return result;
	}
	
	// 이메일 중복 체크용
		public int emailCheck(String memberEmail) {
			int result = 0;
			Connection conn = null;
			conn = getConnection();
				
			result = new MemberDao().emailCheck(conn, memberEmail);
			close(conn);
			return result;
		}
}
