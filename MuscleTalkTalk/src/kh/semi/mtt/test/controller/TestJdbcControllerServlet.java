package kh.semi.mtt.test.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class TestJdbcControllerServlet
 */
@WebServlet("/TestJdbcControllerServlet")
public class TestJdbcControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestJdbcControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVo memberVo = memberService.readOneMember("admin1");
		String memberId = memberVo.getMemberId();
		String memberPassword = memberVo.getMemberPassword();
		System.out.println("memberVo: "+memberVo);
		System.out.println("memberId: "+memberId);
		request.setAttribute("memberId", memberId);
		request.setAttribute("memberPassword", memberPassword);
		request.getRequestDispatcher("WEB-INF/view/testpjm/mainpjm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
