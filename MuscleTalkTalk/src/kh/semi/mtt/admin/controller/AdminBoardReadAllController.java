package kh.semi.mtt.admin.controller;

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

import kh.semi.mtt.common.function.PagingController;
import kh.semi.mtt.common.function.PagingVo;
import kh.semi.mtt.totalboard.model.vo.TotalBoardVo;
import kh.semi.mtt.totalboard.service.TotalBoardService;

/**
 * Servlet implementation class BoardReadAllControllerServlet
 */
@WebServlet("/adminboard")
public class AdminBoardReadAllController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TotalBoardService service = new TotalBoardService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminBoardReadAllController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		exec(request, response);
		request.getRequestDispatcher("WEB-INF/view/admin/adminboard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ajax
		PrintWriter out = response.getWriter();

		exec(request, response);

		HashMap<String, Object> mapObj = new HashMap<String, Object>();

		mapObj.put("boardreadall", request.getAttribute("boardreadall"));
		mapObj.put("startPage", request.getAttribute("startPage"));
		mapObj.put("currentPage", request.getAttribute("currentPage"));
		mapObj.put("endPage", request.getAttribute("endPage"));
		mapObj.put("totalpageCnt", request.getAttribute("totalpageCnt"));

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String gsonOut = gson.toJson(mapObj);
		System.out.println("adminboard ajax result: " + gsonOut);
		out.print(gsonOut);

		out.flush();
		out.close();
	}

	private void exec(HttpServletRequest request, HttpServletResponse response) {
		HttpServletRequest resultRequest = null;
		int totalCnt = new TotalBoardService().countTotalBoard();
		PagingVo setVo = new PagingVo(10, 5, request.getParameter(""), request.getParameter("page"), totalCnt);
		PagingVo pageVo = new PagingController().setPagingValue(setVo);
		System.out.println("pageVo:" + pageVo);
		// 검색기능 미완
//		String search_ = request.getParameter("s");
//		String search = "";
//		if (search_ != null) {
//			search = search_;
//		}
		//
		ArrayList<TotalBoardVo> result = service.totalBoardReadAll(pageVo.getStartRnum(), pageVo.getEndRnum(), pageVo.getFilterint(), pageVo.getSearch());
		System.out.println(result);
		System.out.println("여기루 오나요???");

		request.setAttribute("boardreadall", result);
		request.setAttribute("startPage", pageVo.getStartPage());
		request.setAttribute("endPage", pageVo.getEndPage());
		request.setAttribute("totalpageCnt", pageVo.getTotalpageCnt());
		request.setAttribute("currentPage", pageVo.getCurrentPage());
//		request.setAttribute("boardCategoryNumber", boardCategoryNumber);
	}

}
