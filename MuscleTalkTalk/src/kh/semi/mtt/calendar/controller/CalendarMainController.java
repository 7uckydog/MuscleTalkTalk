package kh.semi.mtt.calendar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.ptcalendar.model.service.PtCalendarService;
import kh.semi.mtt.ptcalendar.model.vo.PtCalendarVo;

/**
 * Servlet implementation class CalendarMainController
 */
@WebServlet("/calendar")
public class CalendarMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalendarMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/calendar enter");
		MemberVo mvo = (MemberVo) request.getSession().getAttribute("ssMvo");
		if(mvo == null) {
			request.setAttribute("msg", "로그인후 이용가능합니다.");
			request.setAttribute("href", "login");
			request.getRequestDispatcher("WEB-INF/view/calendar/calendarError.jsp").forward(request, response);
			return;
		}
		ArrayList<PtCalendarVo> ptCalList = new PtCalendarService().readMyReservation(mvo.getMemberNo());
		
		request.setAttribute("ptCalList", ptCalList);
		
		request.getRequestDispatcher("WEB-INF/view/calendar/calendar.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
