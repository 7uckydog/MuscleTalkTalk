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
			System.out.println("로그인 성공");
			request.getSession().setAttribute("ssMvo", vo);
			request.setAttribute("location", "main");
//			response.sendRedirect(request.getContextPath()+"/main");
			request.getRequestDispatcher("WEB-INF/view/common/pageReplace.jsp").forward(request, response);
		}
	}

}
