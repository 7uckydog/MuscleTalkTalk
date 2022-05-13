package kh.semi.mtt.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.board.model.service.BoardService;
import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.notice.model.service.NoticeService;
import kh.semi.mtt.notice.model.vo.NoticeVo;
import kh.semi.mtt.pt.model.service.PtService;
import kh.semi.mtt.pt.model.vo.PtVo;

/**
 * Servlet implementation class MainControllerServlet
 */
@WebServlet("/")
public class MainControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<BoardVo> boardVoList = new BoardService().mainBoard();
		ArrayList<PtVo> ptVoList = new PtService().mainPt();
		ArrayList<NoticeVo> noticeVoList = new NoticeService().mainNotice();
		request.setAttribute("boardVoList", boardVoList);
		request.setAttribute("ptVoList", ptVoList);
		request.setAttribute("noticeVoList", noticeVoList);
		request.getRequestDispatcher("WEB-INF/view/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
