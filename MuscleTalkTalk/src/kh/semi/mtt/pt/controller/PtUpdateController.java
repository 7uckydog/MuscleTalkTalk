package kh.semi.mtt.pt.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.pt.model.service.PtService;
import kh.semi.mtt.pt.model.vo.PtVo;

/**
 * Servlet implementation class PtUpdateController
 */
@WebServlet("/ptupdate")
public class PtUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/ptupdate doPost 방식 호출");
		
		String ptNoStr = request.getParameter("ptNo");
		int ptNo = 0;
		try {
			ptNo = Integer.parseInt(ptNoStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		PtVo pVo = new PtService().readPt(ptNo);
		Timestamp ptStartTimestamp = new PtService().readPtStartTime(ptNo);
		

		pVo.setPtStartDate(ptStartTimestamp.toString().substring(0, 10));
		System.out.println("/ptupdate pVo 결과:: " + pVo);
		request.setAttribute("pVo", pVo);
		request.getRequestDispatcher("WEB-INF/view/ptpage/ptupdate.jsp").forward(request, response);
	}

}
