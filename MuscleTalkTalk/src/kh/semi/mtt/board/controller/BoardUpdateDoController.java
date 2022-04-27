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
 * Servlet implementation class boardupdatedo
 */
@WebServlet("/boardupdate.do")
public class BoardUpdateDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateDoController() {
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
		int result = -1;
		BoardVo vo = new BoardVo();
		vo.setBoardTitle(request.getParameter("boardTitle"));
		vo.setBoardContent(request.getParameter("boardContent"));
		try {
			vo.setBoardNo(Integer.parseInt(request.getParameter("BNO")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(request.getParameter("boardTitle"));
		System.out.println(request.getParameter("boardContent"));
		result = new BoardService().updateBoard(vo);
		System.out.println("/boardupdate.do result: "+result);
		if(result ==1) {
			System.out.println("/boardupdate.do update success");
			response.sendRedirect("BoardReadAll");
		}
		
		
	}

}
