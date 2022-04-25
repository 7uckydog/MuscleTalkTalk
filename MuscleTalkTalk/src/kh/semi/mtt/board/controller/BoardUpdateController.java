package kh.semi.mtt.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.board.model.service.BoardService;
import kh.semi.mtt.board.model.vo.BoardVo;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/boardupdate")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/boardupdate 들어옴");
		String bnoStr = request.getParameter("bno");
		int bNo = 0;
		try {
			bNo = Integer.parseInt(bnoStr);
		}catch(Exception e){
			e.printStackTrace();
			
		}if(bNo < 1) {
			response.sendRedirect("BoardReadAll");
			System.out.println("수정실패");
			return;
		}
		BoardVo result = new BoardService().readBoard(bNo);
		System.out.println(result);
		result.setBoardContent(result.getBoardContent().replaceAll("(\r\n|\n)", "<br>"));
		result.setBoardContent(result.getBoardContent().replaceAll("", ""));
		System.out.println(result);
		request.setAttribute("bvo", result);
		request.getRequestDispatcher("WEB-INF/view/board/boardupdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
