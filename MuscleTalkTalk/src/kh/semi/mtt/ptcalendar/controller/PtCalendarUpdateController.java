package kh.semi.mtt.ptcalendar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.pt.model.service.PtService;
import kh.semi.mtt.pt.model.vo.PtVo;
import kh.semi.mtt.ptcalendar.model.service.PtCalendarService;
import kh.semi.mtt.ptcalendar.model.vo.PtCalendarVo;

/**
 * Servlet implementation class PtCalendarUpdateController
 */
@WebServlet("/ptreservationupdate")
public class PtCalendarUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtCalendarUpdateController() {
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
		System.out.println("/ptreservationupdate enter");
		MemberVo mVo = (MemberVo)request.getSession().getAttribute("ssMvo");
		if(mVo == null) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		String ptCalendarNoStr = request.getParameter("ptCalendarNo");
		String ptNoStr = request.getParameter("ptNo");
		int ptCalendarNo = 0;
		int ptNo = 0;
		try {
			ptCalendarNo = Integer.parseInt(ptCalendarNoStr);
			ptNo = Integer.parseInt(ptNoStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		PtVo pVo = new PtService().readPt(ptNo);
		ArrayList<PtCalendarVo> ptCalList = null;
		ptCalList = new PtCalendarService().readAllReservation(ptNo);
		PtCalendarVo ptCalendarVo = new PtCalendarService().readOneReservation(ptCalendarNo);
		request.setAttribute("ptCalendarNo", ptCalendarNo);
		request.setAttribute("ptCalendarVo", ptCalendarVo);
		request.setAttribute("ptCalList", ptCalList);
		request.setAttribute("pVo", pVo);
		request.getRequestDispatcher("WEB-INF/view/ptpage/ptcalendarupdate.jsp").forward(request, response);
	}

}
