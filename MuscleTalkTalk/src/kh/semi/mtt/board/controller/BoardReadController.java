package kh.semi.mtt.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.test.first.board.model.service.BoardService;
import kh.test.first.board.model.vo.BoardVo;

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
		String bNoStr = request.getParameter("bno");
		int bNo = 0;
		try {
			bNo = Integer.parseInt(bNoStr);
		}catch (NumberFormatException e) {
			e.printStackTrace();
		}
		BoardVo result = new BoardService().readBoard(bNo);
		System.out.println(result);
		result.setbContent(result.getbContent().replaceAll("(\r\n|\n)", "<br>"));
		result.setbContent(result.getbContent().replaceAll("", "&nbsp;"));
		System.out.println(result);
		request.setAttribute("bvo", result);
		request.getRequestDispatcher("WEB-INF/view/board/read.jsp").forward(request, response);
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
