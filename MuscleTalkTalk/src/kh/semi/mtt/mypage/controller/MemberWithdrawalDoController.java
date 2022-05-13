package kh.semi.mtt.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class MemberWithdrawalController
 */
@WebServlet("/memberwithdrawal.ax")
public class MemberWithdrawalDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberWithdrawalDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("WEB-INF/view/testsyb/mypage_withdrawal.jsp").forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		MemberVo ssMvo = (MemberVo)request.getSession().getAttribute("ssMvo");
		String memberId = ssMvo.getMemberId();
		String memberPassword = request.getParameter("memberPassword");
		
		int num = -1;
		int result = -1;
		result = new MemberService().withdrawal(memberId, memberPassword);
		
		if(result == 0) {
			System.out.println("회원 탈퇴 실패");
			num = 0;
		}else if(result ==1) {
			System.out.println("회원 탈퇴 성공");
			num = 1;
		}
		
		out.print(num);
		out.flush();
		out.close();
	}

}
