package kh.semi.mtt.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.semi.mtt.board.model.service.BoardService;
import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.common.function.PagingController;
import kh.semi.mtt.common.function.PagingVo;
import kh.semi.mtt.notice.model.service.NoticeService;
import kh.semi.mtt.notice.model.vo.NoticeVo;

/**
 * Servlet implementation class FilterAjaxController
 */
@WebServlet("/filterAjaxController")
public class FilterAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BoardService service = new BoardService();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FilterAjaxController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String search = null;
//		request = exec(request, response, search);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ajx하러 왔습니다.");

		int currentPage = 1;
		String currentpageStr = request.getParameter("page");
		try {
			currentPage = Integer.parseInt(currentpageStr);
			System.out.println("ajax하러와서 currentPage: " + currentPage);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		final int pageSize = 13; // 한 페이지당 보여주는 행(글)의 갯수
		final int pageBlock = 3; // 페이지 하단에 나타날 페이지 숫자의 수 / ex) 1 2 3 >>

		int startPage = 0;
		int endPage = 0;
		int startRnum = 0;
		int endRnum = 0;

		int totalCnt = 0; // 총 게시물 수
//        totalCnt = countBoard();
		totalCnt = new BoardService().countBoard();
		System.out.println("총 게시물 수: " + totalCnt);

		// Paging 처리
		int totalPageCnt = (totalCnt / pageSize) + (totalCnt % pageSize == 0 ? 0 : 1);
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > totalPageCnt) {
			endPage = totalPageCnt;
		}
		System.out.println("page: " + startPage + " ~ " + endPage);

		// rownum 처리
		startRnum = totalCnt - (currentPage - 1) * pageSize; 
		endRnum = startRnum - pageSize + 1;
		if (endRnum < 1) {
			endRnum = 1;
		}
		
		
		String search = request.getParameter("inputsearch");
		exec(request, response, search);
		
		
		System.out.println();
		String filterStr = request.getParameter("filters");
		int filterint = 0;
		try {
			filterint = Integer.parseInt(filterStr);
			System.out.println("ajax하러와서 filterint: " + filterint);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		Gson gobj = new GsonBuilder().setDateFormat("yyyy-MM-dd").setPrettyPrinting().create();
		ArrayList<BoardVo> result = new BoardService().readAllBoard(endRnum, startRnum, filterint,search);

		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardlist", result); 
		map.put("startPage", startPage);
		map.put("endPage", endPage); 
		map.put("currentPage", currentPage);
		map.put("totalPageCnt", totalPageCnt);
		
		System.out.println(map);
		String resStr = gobj.toJson(map);

		out.println(resStr);
		out.flush();
		out.close();
	}
	private HttpServletRequest exec(HttpServletRequest request, HttpServletResponse response, String search) {
		int filter = 0;
		HttpServletRequest resultRequest = null;
		int totalCnt = new NoticeService().countNotice();
		PagingVo setVo = new PagingVo(10, 5, request.getParameter(""), request.getParameter("page"), totalCnt);
		PagingVo pageVo = new PagingController().setPagingValue(setVo);
		System.out.println("pageVo:" + pageVo);

		pageVo.setSearch(search);
		ArrayList<BoardVo> result = service.readAllBoard(pageVo.getStartRnum(), pageVo.getEndRnum(),filter, pageVo.getSearch());
		System.out.println(result);
		
		request.setAttribute("boardreadall", result);
		request.setAttribute("startPage", pageVo.getStartPage());
		request.setAttribute("endPage", pageVo.getEndPage());
		request.setAttribute("totalpageCnt", pageVo.getTotalpageCnt());
		request.setAttribute("currentPage", pageVo.getCurrentPage());
		
		return request;
	}

}
