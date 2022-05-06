package kh.semi.mtt.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.inquiry.model.service.InquiryService;
import kh.semi.mtt.inquiry.model.vo.InquiryVo;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class MemberInquiryReadController
 */
@WebServlet("/memberinquiryread")
public class MemberInquiryReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInquiryReadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVo ssMvo = (MemberVo)request.getSession().getAttribute("ssMvo");
		String memberId = ssMvo.getMemberId();
		String inquiryTitle = request.getParameter("ititle");
		
		InquiryVo ivo = new InquiryService().readinquiry(memberId, inquiryTitle);
		request.setAttribute("ivo", ivo);
		
		request.getRequestDispatcher("WEB-INF/view/testsyb/mypage_inquiry_read.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
