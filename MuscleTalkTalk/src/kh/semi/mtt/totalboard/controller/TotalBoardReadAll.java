package kh.semi.mtt.totalboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.totalboard.model.vo.TotalBoardVo;
import kh.semi.mtt.totalboard.service.TotalBoardService;

/**
 * Servlet implementation class TotalBoard
 */
@WebServlet("/totalboardreadall")
public class TotalBoardReadAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private TotalBoardService service = new TotalBoardService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TotalBoardReadAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1;
		int filter = 0;
		
		String currentPageStr = request.getParameter("page");
		try {
			if(currentPageStr !=null && !currentPageStr.equals(""))
			currentPage = Integer.parseInt(currentPageStr);
		}catch (NumberFormatException e) {
			e.printStackTrace();
		}

		final int pageSize = 13; // 한페이지에 보여줄 행
		final int pageBlock = 3; // 페이징에 나타날 페이지수
		int startPage = 0;
		int endPage = 0;
		int startRnum = 0;
		int endRnum = 0;

		int totalCnt = 0; // 총 글수
		totalCnt = countTotalBoard();
		System.out.println("총" + totalCnt);

		// Paging 처리
		int totalpageCnt = (totalCnt / pageSize) + (totalCnt % pageSize == 0 ? 0 : 1);
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > totalpageCnt) {
			endPage = totalpageCnt;
		}
		System.out.println("page:" + startPage + "~" + endPage);

		// rownum 처리
		startRnum = totalCnt - (currentPage - 1) * pageSize; 
		endRnum = startRnum - pageSize + 1;
		if (endRnum < 1) {
			endRnum = 1;
		}
		
		System.out.println("페이지로넘");
		System.out.println(startRnum);
		System.out.println(endRnum);
		
		
		ArrayList<TotalBoardVo> result = service.totalBoardReadAll(endRnum,startRnum);
		
		request.setAttribute("totalboardreadall", result);
		request.setAttribute("startPage", startPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalpageCnt", totalpageCnt);
		System.out.println("통합보드 컨트롤러");
		System.out.println("totalboardreadall: "+result);
		request.getRequestDispatcher("WEB-INF/view/totalboard/totalboard.jsp").forward(request, response);
		
		
		
	}

	private int countTotalBoard() {
		int result = service.countTotalBoard();
		return result;
	}
	
	
}
