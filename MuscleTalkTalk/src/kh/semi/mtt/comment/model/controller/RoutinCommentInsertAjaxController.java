package kh.semi.mtt.comment.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.comment.model.service.CommentService;
import kh.semi.mtt.comment.model.vo.CommentVo;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class RoutinCommentInsertAjaxController
 */
@WebServlet("/routincommentinsert.ax")
public class RoutinCommentInsertAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoutinCommentInsertAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("루틴보드댓글에이작스 들어옴");
		
		String bNoStr = request.getParameter("bNo");
		int bNo = 0;
		try {
			bNo = Integer.parseInt(bNoStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(bNo <= 0) {  // 숫자로 변환하지 못한 경우, bNo에 0,음수가 입력되어 들어온 경우
			response.sendRedirect("routineboardreadall");
			return;
		}
		String reComment = request.getParameter("reComment");
		CommentVo vo  = new CommentVo();
		MemberVo mvo = (MemberVo) request.getSession().getAttribute("ssMvo");
		
		vo.setRoutineboardNo(bNo);
		vo.setCommentContent(reComment);
		int result = new CommentService().writeRoutineBoardReComment(vo,mvo);
		if(result<1) {
			response.sendRedirect("routineboardreadall");
		} else {
			response.sendRedirect("routineboardread?bno="+bNo);
		}
	}

}
