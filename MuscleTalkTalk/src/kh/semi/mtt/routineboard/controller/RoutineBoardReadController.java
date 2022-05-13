package kh.semi.mtt.routineboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kh.semi.mtt.comment.model.service.CommentService;
import kh.semi.mtt.comment.model.vo.CommentVo;
import kh.semi.mtt.routineboard.model.service.RoutineBoardService;
import kh.semi.mtt.routineboard.model.vo.RoutineBoardVo;

/**
 * Servlet implementation class RoutineBoardReadController
 */
@WebServlet("/routineboardread")
public class RoutineBoardReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoutineBoardReadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("루틴리드보드로 들어옴");
		String bNoStr = request.getParameter("bno"); //<td><a href="boardread?bno=${vo.boardNo}">
		int bNo = 0;
		try {
			bNo = Integer.parseInt(bNoStr);
		}catch (NumberFormatException e) {
			e.printStackTrace();
		}
		RoutineBoardVo result = new RoutineBoardService().readRoutineBoard(bNo);
		System.out.println(result);
		result.setRoutineboardContent(result.getRoutineboardContent().replaceAll("(\r\n|\n)", "<br>"));
		result.setRoutineboardContent(result.getRoutineboardContent().replaceAll("", ""));
		System.out.println(result);
		
		ArrayList<CommentVo> cVoList = new CommentService().readRoutineBoardReComment(bNo);
		System.out.println(cVoList);
		request.setAttribute("bvo", result);
		request.setAttribute("cVoList", cVoList);

		request.getRequestDispatcher("WEB-INF/view/routineboard/routineread.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
