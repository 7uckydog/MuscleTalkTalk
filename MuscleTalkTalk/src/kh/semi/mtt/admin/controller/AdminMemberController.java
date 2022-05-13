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

import kh.semi.mtt.board.model.service.BoardService;
import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.common.function.PagingController;
import kh.semi.mtt.common.function.PagingVo;
import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.AdminVo;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class AdminMemberController
 */
@WebServlet("/adminmember")
public class AdminMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService service = new MemberService(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int filterint = 0;
		request = exec(request, response, filterint);
		request.getRequestDispatcher("WEB-INF/view/admin/adminmember.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/adminmember ajax enter");
		String filterStr = request.getParameter("filters");
		int filterint = 0;
		try {
			filterint = Integer.parseInt(filterStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		exec(request, response, filterint);
		PrintWriter out = response.getWriter();
		
		HashMap<String, Object> mapObj = new HashMap<String, Object>();
		mapObj.put("memberreadall", request.getAttribute("memberreadall"));
		mapObj.put("startPage", request.getAttribute("startPage"));
		mapObj.put("currentPage", request.getAttribute("currentPage"));
		mapObj.put("endPage", request.getAttribute("endPage"));
		mapObj.put("totalpageCnt", request.getAttribute("totalpageCnt"));
		
		Gson gobj = new GsonBuilder().setDateFormat("yyyy-MM-dd").setPrettyPrinting().create();
		String gsonOut = gobj.toJson(mapObj);
		System.out.println("/adimmember ajax result : " + gsonOut);
		out.print(gsonOut);
		
		out.flush();
		out.close();
	}
	
	private int countMember() {
		int result = service.countMember();
		return result;
	}
	
	private HttpServletRequest exec(HttpServletRequest request, HttpServletResponse response, int filterint) {
		HttpServletRequest resultRequest = null;
		int totalCnt = new MemberService().countMember();
		PagingVo setVo = new PagingVo(10, 5, request.getParameter(""), request.getParameter("page"), totalCnt);
		PagingVo pageVo = new PagingController().setPagingValue(setVo);
		System.out.println("pageVo:" + pageVo);
		
		pageVo.setFilterint(filterint);
		ArrayList<AdminVo> result = service.readAllMember(pageVo.getStartRnum(), pageVo.getEndRnum(), pageVo.getSearch(), pageVo.getFilterint());
		System.out.println("exec에서 result"+result);

		request.setAttribute("memberreadall", result);
		request.setAttribute("startPage", pageVo.getStartPage());
		request.setAttribute("endPage", pageVo.getEndPage());
		request.setAttribute("totalpageCnt", pageVo.getTotalpageCnt());
		request.setAttribute("currentPage", pageVo.getCurrentPage());
		resultRequest = request;
		return resultRequest;
	}

}
