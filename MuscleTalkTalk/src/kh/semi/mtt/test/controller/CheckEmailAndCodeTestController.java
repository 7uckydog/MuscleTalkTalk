package kh.semi.mtt.test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.vo.EmailVo;

/**
 * Servlet implementation class CheckEmailAndCodeTestController
 */
@WebServlet("/checkemailandcode")
public class CheckEmailAndCodeTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmailAndCodeTestController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		System.out.println("인증번호랑 이메일 정보 일치하는지 확인하러 왔습니다.");
		String emailCertificationCode = request.getParameter("modal_code");
		String memberEmail = request.getParameter("member_email");
		
		EmailVo evo = new EmailService().checkEmailAndCode(emailCertificationCode, memberEmail);
		if(evo == null) {
			// 이메일 인증 실패
			System.out.println("실패");
		} else{
			// 이메일 인증 성공
			System.out.println("이메일 인증 성공");
			// 이메일 테이블 내 정보 삭제
			int result = new EmailService().deleteTableInfo(emailCertificationCode, memberEmail);
			System.out.println("정보 삭제 성공");
		}
		out.flush();
		out.close();
		
	}

}
