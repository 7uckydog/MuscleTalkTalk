package kh.semi.mtt.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.board.model.service.BoardService;
import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.comment.model.service.CommentService;
import kh.semi.mtt.comment.model.vo.CommentVo;

/**
 * Servlet implementation class BoardReadController
 */
@WebServlet("/boardread")
public class BoardReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bNoStr = request.getParameter("bno"); //<td><a href="boardread?bno=${vo.boardNo}">
		int bNo = 0;
		try {
			bNo = Integer.parseInt(bNoStr);
		}catch (NumberFormatException e) {
			e.printStackTrace();
		}
		BoardVo result = new BoardService().readBoard(bNo);
		System.out.println(result);
		result.setBoardContent(result.getBoardContent().replaceAll("(\r\n|\n)", "<br>"));
		result.setBoardContent(result.getBoardContent().replaceAll("", ""));
		System.out.println(result);
		
		ArrayList<CommentVo> cVoList = new CommentService().readBoardReComment(bNo);
		System.out.println(cVoList);
		request.setAttribute("bvo", result);
		request.setAttribute("cVoList", cVoList);
		request.getRequestDispatcher("WEB-INF/view/board/boardread.jsp").forward(request, response);
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}


