package kh.semi.mtt.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.board.model.service.BoardService;
import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.common.function.PagingController;
import kh.semi.mtt.common.function.PagingVo;
import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.AdminVo;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class AdminMemberController
 */
@WebServlet("/adminmemberread")
public class AdminMemberReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService service = new MemberService(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberReadController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/adminmemberread enter");
		String memberNoStr = request.getParameter("memberNo");
		int memberNo = 0;
		try {
			memberNo = Integer.parseInt(memberNoStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		MemberVo result = new MemberService().readOneMember(memberNo);
		System.out.println("adminmemberread result : " + result);
		request.setAttribute("mvo", result);
		request.getRequestDispatcher("WEB-INF/view/admin/adminmemberread.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}

}
