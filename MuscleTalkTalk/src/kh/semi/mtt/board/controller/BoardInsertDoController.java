package kh.semi.mtt.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.board.model.service.BoardService;

/**
 * Servlet implementation class BoardInsertDoController
 */
@WebServlet("/boardinsert.do")
public class BoardInsertDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertDoController() {
        super();
        // TODO Auto-generated constructor stub
    }


    
    
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		System.out.println(boardTitle);
		System.out.println(boardContent);
		
		
		BoardVo vo = new BoardVo();
		vo.setBoardTitle(boardTitle);
		vo.setBoardContent(boardContent);
		int result = new BoardService().insertBoard(vo);
		if(result < 1) { //글등록 실패
			response.sendRedirect("main");
			System.out.println("자유게시글 등록실패");
		}else { // 글등록
			response.sendRedirect("main");
			System.out.println("자유게시글 등록성공");
		}
	}

}

