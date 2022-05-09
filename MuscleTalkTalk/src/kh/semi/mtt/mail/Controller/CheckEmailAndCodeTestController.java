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
		String emailCertificationCode = request.getParameter("modal_code");
		String memberEmail = request.getParameter("member_email");
		
		EmailVo evo = new EmailService().checkEmailAndCode(emailCertificationCode, memberEmail);
		int num = -1;
		if(evo == null) {
			// 이메일 인증 실패
			System.out.println("이메일 인증 번호 불일치");
			int result2 = new EmailService().deleteTableInfo2(memberEmail);
			System.out.println("인증 실패로 정보 삭제");
			num = 0;
//			request.getRequestDispatcher("findId.jsp").forward(request, response);
		} else{
			// 이메일 인증 성공
			System.out.println("이메일 인증 성공");
			// 이메일 테이블 내 정보 삭제
			int result = new EmailService().deleteTableInfo(emailCertificationCode, memberEmail);
			System.out.println("정보 삭제 성공");
			num = 1;
		}
		out.print(num);
		out.flush();
		out.close();
		
	}

}
