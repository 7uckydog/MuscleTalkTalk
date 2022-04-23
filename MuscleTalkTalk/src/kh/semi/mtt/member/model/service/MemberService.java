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
		return retVo;
	}
	
	public MemberVo findIdfromNameAndEmail(String memberName, String memberEmail) {
		MemberVo retVo = null;
		Connection conn = null;
		conn = getConnection();
		System.out.println("service- name:" + memberName);
		System.out.println("service- email:" + memberEmail);
		retVo = dao.findIdfromNameAndEmail(conn, memberName, memberEmail);
		return retVo;
	}
}
