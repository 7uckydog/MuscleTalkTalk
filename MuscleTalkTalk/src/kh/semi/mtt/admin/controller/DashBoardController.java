package kh.semi.mtt.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.board.model.service.BoardService;
import kh.semi.mtt.comment.model.service.CommentService;
import kh.semi.mtt.comment.model.vo.CommentVo;
import kh.semi.mtt.common.function.PagingVo;
import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.AdminVo;
import kh.semi.mtt.totalboard.model.vo.TotalBoardVo;
import kh.semi.mtt.totalboard.service.TotalBoardService;

/**
 * Servlet implementation class DashBoardController
 */
@WebServlet("/dashboard")
public class DashBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<AdminVo> commentresult = new CommentService().dashboardComment();
		request.setAttribute("NOTC", commentresult);
		
		ArrayList<AdminVo> memberresult = new MemberService().dashboardMember();
		request.setAttribute("NOTM", memberresult);
		
		ArrayList<AdminVo> boardresult = new BoardService().dashboardBoard();
		request.setAttribute("NOTB", boardresult);
		
		request.getRequestDispatcher("WEB-INF/view/admin/dashboard.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
