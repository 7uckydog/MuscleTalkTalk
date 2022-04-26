package kh.semi.mtt.mail.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.mail.model.service.EmailService;
import kh.semi.mtt.member.model.vo.EmailVo;

/**
 * Servlet implementation class SendMailForJoinController
 */
@WebServlet("/SendMailForJoinController")
public class SendMailForJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMailForJoinController() {
        super();
        // TODO Auto-generated constructor stub
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
		
		String memberEmail = request.getParameter("member_email");
		EmailVo evo = new EmailService().findRandomNumber(memberEmail);
		
		SendMail.send("[머슬톡톡] 회원가입 인증번호", "안녕하세요 머슬톡톡입니다. 회원가입을 위한 인증번호 안내드립니다. 인증번호: " + evo.getEmailCertificationCode() , memberEmail);
	}

}
