package kh.semi.mtt.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.inquiry.model.service.InquiryService;
import kh.semi.mtt.reservation.model.service.ReservationService;

/**
 * Servlet implementation class MemberCancelReservationController
 */
@WebServlet("/membercancelreservation.ax")
public class MemberCancelReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCancelReservationController() {
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
		PrintWriter out = response.getWriter();
		System.out.println("에이작스 하러 왔습니다");
		
		String ptCalendarNoStr = request.getParameter("ptCalendarNo");
		System.out.println(ptCalendarNoStr);
		String memberNoStr = request.getParameter("memberNo");
		int ptCalendarNo = -1;
		int memberNo = -1;
		try {
			ptCalendarNo = Integer.parseInt(ptCalendarNoStr);
			memberNo = Integer.parseInt(memberNoStr);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		int result = new ReservationService().cancelReservation(ptCalendarNo, memberNo);
		int num = -1;
		
		if(result == 1) {
			num = 1;
			System.out.println("예약 취소 성공");
		} else if(result == 0) {
			num = 0;
			System.out.println("예약 취소 성공");
		} else {
			System.out.println("오류");
		}
		
		out.print(num);
		out.flush();
		out.close();
	}

}
