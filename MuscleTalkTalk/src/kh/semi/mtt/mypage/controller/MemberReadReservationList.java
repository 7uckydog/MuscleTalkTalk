package kh.semi.mtt.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.inquiry.model.service.InquiryService;
import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.reservation.model.service.ReservationService;

/**
 * Servlet implementation class MemberReadReservationList
 */
@WebServlet("/MemberReadReservationList")
public class MemberReadReservationList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReadReservationList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVo ssMvo = (MemberVo)request.getSession().getAttribute("ssMvo");
		int memberNo = ssMvo.getMemberNo();
		
		int currentPage = 1;
		String currentPageStr = request.getParameter("page");
		try {
			if(currentPageStr !=null && !currentPageStr.equals("")) {
				currentPage = Integer.parseInt(currentPageStr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
//		request.getRequestDispatcher("").forward(request, response);
	}
	private int countReservation_member(int memberNo) {
		int result = new ReservationService().countReservation_member(memberNo);
		return result;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
