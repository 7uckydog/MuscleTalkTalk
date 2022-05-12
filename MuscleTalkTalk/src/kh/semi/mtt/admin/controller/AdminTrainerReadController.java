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
@WebServlet("/admintrainerread")
public class AdminTrainerReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService service = new MemberService(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTrainerReadController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/admintrainerread enter");
		String trainerNoStr = request.getParameter("TrainerNo");
		int trainerNo = 0;
		try {
			trainerNo = Integer.parseInt(trainerNoStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		MemberVo result = new MemberService().readTrainerMember(trainerNo);
		request.setAttribute("mvo", result);
		request.getRequestDispatcher("WEB-INF/view/admin/admintrainerread.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
