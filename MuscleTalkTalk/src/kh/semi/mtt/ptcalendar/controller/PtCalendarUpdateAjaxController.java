package kh.semi.mtt.ptcalendar.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.ptcalendar.model.service.PtCalendarService;

/**
 * Servlet implementation class PtCalendarUpdateAjaxController
 */
@WebServlet("/ptcalupdate.ax")
public class PtCalendarUpdateAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtCalendarUpdateAjaxController() {
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
		System.out.println("/ptcalupdate.ax enter");
		
		String prevPtCalendarNoStr = request.getParameter("prevPtCalendarNo");
		String memberNoStr = request.getParameter("memberNo");
		String ptCalendarNoStr= request.getParameter("ptCalendarNo");
		
		int prevPtCalendarNo = 0;
		int memberNo = 0;
		int ptCalendarNo = 0;
		
		try {
			prevPtCalendarNo = Integer.parseInt(prevPtCalendarNoStr);
			memberNo = Integer.parseInt(memberNoStr);
			ptCalendarNo = Integer.parseInt(ptCalendarNoStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		int result = new PtCalendarService().updateReservation(prevPtCalendarNo, ptCalendarNo, memberNo);
		System.out.println(result);
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}

}
