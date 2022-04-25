package kh.semi.mtt.pt.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.pt.model.service.PtService;
import kh.semi.mtt.pt.model.vo.PtVo;

/**
 * Servlet implementation class PtListController
 */
@WebServlet("/ptlist")
public class PtListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/ptlist doGet 방식 호출");
		ArrayList<PtVo> ptVoList = new PtService().readAllPt();
		System.out.println("/ptlist doGet ptVoList 결과:  " + ptVoList);
		request.setAttribute("ptVoList", ptVoList);
		request.getRequestDispatcher("WEB-INF/view/ptpage/ptlistpage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
