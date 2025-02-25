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

import kh.semi.mtt.comment.model.service.CommentService;
import kh.semi.mtt.comment.model.vo.CommentVo;
import kh.semi.mtt.common.function.PagingController;
import kh.semi.mtt.common.function.PagingVo;

/**
 * Servlet implementation class AdminCommentController
 */
@WebServlet("/admincomment")
public class AdminCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommentService service = new CommentService(); 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCommentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = null;
		request = exec(request, response, search);
		
		request.getRequestDispatcher("WEB-INF/view/admin/admincomment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String search = request.getParameter("inputsearch");
		exec(request, response, search);
		
		HashMap<String, Object> mapObj = new HashMap<String, Object>();
		
		mapObj.put("commentreadall", request.getAttribute("commentreadall"));
		mapObj.put("startPage", request.getAttribute("startPage"));
		mapObj.put("currentPage", request.getAttribute("currentPage"));
		mapObj.put("endPage", request.getAttribute("endPage"));
		mapObj.put("totalpageCnt", request.getAttribute("totalpageCnt"));
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String gsonOut = gson.toJson(mapObj);
		System.out.println("noticecomment ajax result: " + gsonOut);
		out.print(gsonOut);
		
		out.flush();
		out.close();
	}
	
	private int countNotice() {   //view에서 호출할일 없고 컨트롤러에서만 계산할때 사용하기때문에 private가능
		int result =  service.countComment();
		return result;
	}
	
	private HttpServletRequest exec(HttpServletRequest request, HttpServletResponse response, String search) {
		HttpServletRequest resultRequest = null;
		int totalCnt = new CommentService().countComment();
		PagingVo setVo = new PagingVo(10, 5, request.getParameter(""), request.getParameter("page"), totalCnt);
		PagingVo pageVo = new PagingController().setPagingValue(setVo);
		System.out.println("pageVo:" + pageVo);

		pageVo.setSearch(search);
		ArrayList<CommentVo> result = new CommentService().readAllComment(pageVo.getStartRnum(), pageVo.getEndRnum(), pageVo.getSearch());
		System.out.println(result);
		
		request.setAttribute("commentreadall", result);
		request.setAttribute("startPage", pageVo.getStartPage());
		request.setAttribute("endPage", pageVo.getEndPage());
		request.setAttribute("totalpageCnt", pageVo.getTotalpageCnt());
		request.setAttribute("currentPage", pageVo.getCurrentPage());
		
		return request;
	}

}
