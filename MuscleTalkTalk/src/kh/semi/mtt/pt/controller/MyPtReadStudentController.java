package kh.semi.mtt.pt.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class MyPtReadStudentController
 */
@WebServlet("/ptreadstudent")
public class MyPtReadStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPtReadStudentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/ptreadstudent 들어옴");
		MemberVo vo = (MemberVo)request.getSession().getAttribute("ssMvo");
		System.out.println(vo);
		if(vo == null) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		if(vo.getMemberTrainer().equals("F")) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		String memberId = request.getParameter("memberId");
		if(memberId == null) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		MemberVo mVo = new MemberService().readOneMember(memberId);
		request.setAttribute("mVo", mVo);
		request.getRequestDispatcher("WEB-INF/view/ptpage/readptstudent.jsp").forward(request, response);
	}

}
