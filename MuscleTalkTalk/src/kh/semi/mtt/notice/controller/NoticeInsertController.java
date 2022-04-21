package kh.semi.mtt.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class BoardWriteController
 */
@WebServlet("/insertNotice")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeInsertController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet - noticewrite");
		request.getRequestDispatcher("WEB-INF/view/board/notice/notiwrite.jsp").forward(request, response);
		// 로그인 상태 확인코드
//		MemberVo ssvo = (MemberVo) request.getSession().getAttribute("ssMV");
//		
//		if (ssvo == null) { // 로그아웃 상태라면 login page 진입 
//			response.sendRedirect("login");
//		} else {  // 로그인한 상태라면 write page 진입
//			request.getRequestDispatcher("WEB-INF/view/board/write.jsp").forward(request, response);
//
//		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
