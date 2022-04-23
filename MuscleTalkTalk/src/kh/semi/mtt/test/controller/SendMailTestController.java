package kh.semi.mtt.test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.EmailVo;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class MailTestController
 */
@WebServlet("/sendEmail")
public class SendMailTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMailTestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String memberName = request.getParameter("member_name");
		String memberEmail = request.getParameter("member_email");

		
		MemberVo vo = new MemberService().findIdfromNameAndEmail(memberName, memberEmail);
		// 이메일에 해당하는 난수 찾기 (메일로 보낼 인증번호 찾기)
		EmailVo evo = new EmailService().findRandomNumber(memberEmail);
		System.out.println("SendEamilDoPost: evo:" + evo);
		if(vo == null) {
			// 회원 정보 조회 실패
		} else {
			// 회원 정보 조회 성공 -> 메일 방송
			SendMail.send("[머슬톡톡] 아이디 찾기 인증번호", "안녕하세요 머슬톡톡입니다. 아이디 찾기를 위한 인정번호 안내드립니다. 인증번호: " + evo.getEmailCertificationCode() , memberEmail);
			System.out.println(evo.getEmailCertificationCode());
			response.setContentType("text/html; charset=UTF-8");
		}
		out.flush();
		out.close();
		
		
	}

}
