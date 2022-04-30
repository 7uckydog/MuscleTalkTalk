package kh.semi.mtt.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.mtt.member.model.dao.MemberDao;
import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class MemberUpdateProfileController
 */
@WebServlet("/memberupdatepassword.ax")
public class MemberUpdatePasswordDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePasswordDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("WEB-INF/view/testsyb/mypage_update.jsp").forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out  = response.getWriter();
		String memberId = request.getParameter("memberId");
		String memberPassword = request.getParameter("memberPassword");
		String memberNewPassword = request.getParameter("memberNewPassword");
		System.out.println(memberId);
		
		int result = new MemberService().updatePassword(memberPassword, memberNewPassword);
		
		if(result == 0) {
			System.out.println("회원정보 수정 실패");
		} else {
			MemberVo Nvo = new MemberService().readOneMember(memberId);
			
			request.getSession().removeAttribute("ssMvo");
			request.getSession().setAttribute("ssMvo", Nvo);
			System.out.println("비밀번호: "+Nvo.getMemberPassword());
		}
		out.flush();
		out.close();
	}
}
