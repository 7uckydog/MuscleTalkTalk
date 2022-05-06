package kh.semi.mtt.pt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.payment.model.service.PaymentService;
import kh.semi.mtt.ptcalendar.model.service.PtCalendarService;

/**
 * Servlet implementation class PtReservationAjaxController
 */
@WebServlet("/ptreservaton.ax")
public class PtReservationAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtReservationAjaxController() {
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
		System.out.println("/ptreservaton.ax에 들어옴");
		PrintWriter out = response.getWriter();
		
		String memberNoStr = request.getParameter("memberNo");
		String ptPriceStr = request.getParameter("ptPrice");
		String ptCalendarNoStr = request.getParameter("ptCalendarNo");
		int memberNo = 0;
		int ptPrice = 0;
		int ptCalendarNo = 0;
		try {
			memberNo = Integer.parseInt(memberNoStr);
			ptPrice = Integer.parseInt(ptPriceStr);
			ptCalendarNo = Integer.parseInt(ptCalendarNoStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		int ptReservationResult = new PtCalendarService().insertReservation(ptCalendarNo, memberNo);
		int ptPaymentResult = new PaymentService().insertPayment(memberNo, ptPrice, ptCalendarNo);
		System.out.println("memberNo : " + memberNo);
		System.out.println("ptPrice : " + ptPrice);
		System.out.println("ptCalendarNo : " + ptCalendarNo);
		System.out.println("pt예약 결과 : " + ptReservationResult);
		System.out.println("pt결제 결과 : " + ptPaymentResult);
		if(ptReservationResult == 1 && ptPaymentResult == 1) {	
			System.out.println("/ptreservaton.ax SUCCESS");
			out.print("success");
		} else {
			System.out.println("/ptreservaton.ax FAIL");
			out.print("fail");
		}
		out.flush();
		out.close();
	}

}
