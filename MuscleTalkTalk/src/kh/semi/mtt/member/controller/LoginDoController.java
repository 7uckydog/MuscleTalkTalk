package kh.semi.mtt.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class LoginDoController
 */
@WebServlet("/login.do")
public class LoginDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginDoController() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memeberId = request.getParameter("memberId");
		String memberPassword = request.getParameter("memberPassword");
		
		MemberVo vo = new MemberService().login(memeberId, memberPassword);
		if(vo == null) {
			request.setAttribute("msg", "아이디와 비밀번호가 맞지 않습니다.");
			request.getRequestDispatcher("WEB-INF/view/common/errorPage.jsp").forward(request, response);
			
		} else {
			System.out.println(vo.getMemberAbsence());
			if(vo.getMemberAbsence().equals("Y")) {
				System.out.println("로그인 실패");
				request.setAttribute("msg", "입력한 아이디와 비밀번호에 해당하는 회원을 조회할 수 없습니다.");
				request.getRequestDispatcher("WEB-INF/view/common/errorPage.jsp").forward(request, response);
				return;
			}
			System.out.println("로그인 성공");
			request.getSession().setAttribute("ssMvo", vo);
			
			String prevPage =request.getHeader("referer");
			System.out.println("foController prevPage: " + prevPage);
			
			String prevPageUri = prevPage.substring(prevPage.lastIndexOf("/")+1);
			System.out.println("prevPageUri:"+ prevPageUri);
			if(prevPage == null || prevPageUri.equals("login")) prevPage=request.getContextPath()+"/";
			
			//request.getRequestDispatcher("WEB-INF/view/common/pageReplace.jsp").forward(request, response);
			
			if(vo.getMemberNo() < 11 ) {
				response.sendRedirect("dashboard");
//			request.getRequestDispatcher("WEB-INF/view/admin/dashboard.jsp").forward(request, response);
			} else {
				response.sendRedirect(prevPage);
//			request.getRequestDispatcher("WEB-INF/view/main.jsp").forward(request, response);
			}
		}
		
	}

}
