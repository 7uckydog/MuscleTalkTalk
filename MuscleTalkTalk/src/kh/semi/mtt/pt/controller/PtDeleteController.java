package kh.semi.mtt.pt.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.pt.model.service.PtService;

/**
 * Servlet implementation class PtDeleteController
 */
@WebServlet("/ptdelete")
public class PtDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtDeleteController() {
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
		System.out.println("/ptdelete Controller 호출됨");
		String ptNoStr = request.getParameter("ptNo");
		int ptNo = 0;
		try {
			ptNo = Integer.parseInt(ptNoStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		int result = new PtService().deletePt(ptNo);
		
		System.out.println("/ptdelete result : " + result);
		response.sendRedirect("myptprogram");
	}

}
