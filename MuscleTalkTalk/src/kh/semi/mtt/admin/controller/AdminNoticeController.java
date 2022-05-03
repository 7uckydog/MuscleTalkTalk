package kh.semi.mtt.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.common.function.PagingController;
import kh.semi.mtt.common.function.PagingVo;
import kh.semi.mtt.notice.model.service.NoticeService;
import kh.semi.mtt.notice.model.vo.NoticeVo;

/**
 * Servlet implementation class AdminNoticeController
 */
@WebServlet("/adminnotice")
public class AdminNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService service = new NoticeService();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = null;
		request = exec(request, response, search);
		
		request.getRequestDispatcher("WEB-INF/view/admin/adminnotice.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
	private int countNotice() {   //view에서 호출할일 없고 컨트롤러에서만 계산할때 사용하기때문에 private가능
		int result =  service.countNotice();
		return result;
	}
	private HttpServletRequest exec(HttpServletRequest request, HttpServletResponse response, String search) {
		HttpServletRequest resultRequest = null;
		int totalCnt = new NoticeService().countNotice();
		PagingVo setVo = new PagingVo(10, 5, request.getParameter(""), request.getParameter("page"), totalCnt);
		PagingVo pageVo = new PagingController().setPagingValue(setVo);
		System.out.println("pageVo:" + pageVo);

		pageVo.setSearch(search);
		ArrayList<NoticeVo> result = service.readAllNotice(pageVo.getStartRnum(), pageVo.getEndRnum(), pageVo.getSearch());
		System.out.println(result);
		
		request.setAttribute("noticereadall", result);
		request.setAttribute("startPage", pageVo.getStartPage());
		request.setAttribute("endPage", pageVo.getEndPage());
		request.setAttribute("totalpageCnt", pageVo.getTotalpageCnt());
		request.setAttribute("currentPage", pageVo.getCurrentPage());
		
		return request;
	}

}
