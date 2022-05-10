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
import kh.semi.mtt.inquiry.model.service.InquiryService;
import kh.semi.mtt.inquiry.model.vo.InquiryVo;

/**
 * Servlet implementation class AdminInquiryController
 */
@WebServlet("/admininquiry")
public class AdminInquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private InquiryService service = new InquiryService();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInquiryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request = exec(request, response);
		request.getRequestDispatcher("WEB-INF/view/admin/admininquiry.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
	private int countInquiry() {
		int result = service.countInquiry();
		return result;
	}
	private HttpServletRequest exec(HttpServletRequest request, HttpServletResponse response) {
		HttpServletRequest resultRequest = null;
		int totalCnt = new InquiryService().countInquiry();
		PagingVo setVo = new PagingVo(10, 5, request.getParameter(""), request.getParameter("page"), totalCnt);
		PagingVo pageVo = new PagingController().setPagingValue(setVo);
		System.out.println("pageVo:" + pageVo);
		
		ArrayList<InquiryVo> result = service.readAllInquiry(pageVo.getStartRnum(), pageVo.getEndRnum(), pageVo.getSearch());
		System.out.println("exec에서 result"+result);

		request.setAttribute("inquiryreadall", result);
		request.setAttribute("startPage", pageVo.getStartPage());
		request.setAttribute("endPage", pageVo.getEndPage());
		request.setAttribute("totalpageCnt", pageVo.getTotalpageCnt());
		request.setAttribute("currentPage", pageVo.getCurrentPage());
		resultRequest = request;
		return resultRequest;
	}
}
