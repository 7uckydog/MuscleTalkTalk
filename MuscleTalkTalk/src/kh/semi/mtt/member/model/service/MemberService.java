package kh.semi.mtt.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;
import static kh.semi.mtt.common.jdbc.JdbcTemplate.getConnection;

import kh.semi.mtt.member.model.dao.MemberDao;
import kh.semi.mtt.member.model.vo.AdminVo;
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
		
	// 회원가입 - 회원 정보 insert
	public int insertMember(MemberVo vo) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		result = new MemberDao().insertMember(conn, vo);
			
		close(conn);
		return result;
	}
		
	// 회원 정보 수정 - 업데이트
	public int updateMember(MemberVo vo) {
		int result = 0;
		Connection conn = null;
		conn = getConnection();
		result = new MemberDao().updateMember(conn, vo);
		
		close(conn);
		return result;
	}
	
	// 회원 비밀번호 수정 - 업데이트
		public int updatePassword(String memberId, String memberPassword, String memberNewPassword) {
			int result = 0;
			Connection conn = null;
			conn = getConnection();
			result = new MemberDao().updatePassword(conn, memberId, memberPassword, memberNewPassword);
			
			close(conn);
			return result;
		}
		
	//회원 전체조회
		public ArrayList<AdminVo> readAllMember(int startRnum, int endRnum, String search){
			Connection conn = null;
			conn = getConnection();
			ArrayList<AdminVo> result = dao.readAllMember(conn, startRnum, endRnum, search);
			close(conn);
			return result;
		}
	
	//갯수세기
		public int countMember() {
			Connection conn = null;
			conn = getConnection();
			int result = dao.countMember(conn);
			close(conn);
			return result;
		}
		
}
