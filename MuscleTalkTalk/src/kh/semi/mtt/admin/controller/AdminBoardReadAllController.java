package kh.semi.mtt.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.semi.mtt.board.model.service.BoardService;
import kh.semi.mtt.board.model.vo.BoardVo;




/**
 * Servlet implementation class BoardReadAllControllerServlet
 */
@WebServlet("/adminboard")
public class AdminBoardReadAllController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BoardService service = new BoardService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardReadAllController() {
        super();
        // TODO Auto-generated constructor stub
    }
    

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		request = test(request);
		request.getRequestDispatcher("WEB-INF/view/admin/adminboard.jsp").forward(request, response);
	
	}

		private int countBoard() {
			int result = service.countBoard();
			return result;
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ajax
		PrintWriter out = response.getWriter();
		
		request = test(request);
		
		ArrayList<Object> testArray = new ArrayList<Object>();
		
		testArray.add(request.getAttribute("boardreadall"));
		testArray.add(request.getAttribute("startPage"));
		testArray.add(request.getAttribute("currentPage"));
		testArray.add(request.getAttribute("endPage"));
		testArray.add(request.getAttribute("totalpageCnt"));
		
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String gsonOut = gson.toJson(testArray);
		System.out.println("adminboard ajax result: " + gsonOut);
		out.print(gsonOut);
		
		out.flush();
		out.close();
	}
	
	private HttpServletRequest test(HttpServletRequest request) {
		HttpServletRequest resultRequest = null;
		
		
		String filterStr = request.getParameter("filters");
		if(filterStr == null) {
			filterStr = "0";
		}
		int filterint = 0;
		try {
			filterint = Integer.parseInt(filterStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int currentPage = 1;


	    final int pageSize = 13; // 한페이지에 보여줄 행
	    final int pageBlock = 3; // 페이징에 나타날 페이지수
	    int startPage = 0;
	    int endPage = 0;
	    int startRnum = 0;
	    int endRnum = 0;
	    
	    int totalCnt = 0; // 총 글수
		
		String currentPageStr = request.getParameter("page");
		try {
			if(currentPageStr !=null && !currentPageStr.equals(""))
			currentPage = Integer.parseInt(currentPageStr);
		}catch (NumberFormatException e) {
			e.printStackTrace();
		}
	    
		totalCnt = countBoard();
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
		startRnum = (currentPage - 1) * pageSize + 1;
		endRnum = startRnum + pageSize - 1;
		if (endRnum > totalCnt) {
			endRnum = totalCnt;
		}
		//검색기능 미완
		String search_ = request.getParameter("s");
		String search = "";
		if(search_ != null) {
			search = search_; 
		}
		//
		System.out.println("rnum:" + startRnum + "~" + endRnum);
		ArrayList<BoardVo> result = service.readAllBoard(startRnum, endRnum, filterint);
		System.out.println(result);



		
		request.setAttribute("boardreadall", result);
		request.setAttribute("startPage", startPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalpageCnt", totalpageCnt);
//		request.setAttribute("boardCategoryNumber", boardCategoryNumber);
		System.out.println("boardreadall: "+result);
		
		
		resultRequest = request;
		
		return resultRequest;
	}
	
}
