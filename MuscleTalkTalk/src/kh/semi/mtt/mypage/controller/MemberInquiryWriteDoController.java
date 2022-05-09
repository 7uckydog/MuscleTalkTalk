package kh.semi.mtt.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.inquiry.model.service.InquiryService;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class MemberInquiryWriteController
 */
@WebServlet("/memberinquirywrite.ax")
public class MemberInquiryWriteDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInquiryWriteDoController() {
        super();
    }

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("WEB-INF/view/testsyb/mypage_inquiry_write.jsp").forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String inqTitle = request.getParameter("inq_title");
		String inqContent = request.getParameter("inq_content");
		MemberVo ssMvo = (MemberVo)request.getSession().getAttribute("ssMvo");
		int memberNo = ssMvo.getMemberNo();

		int num = -1;
		int result = new InquiryService().insertInquiry(memberNo, inqTitle, inqContent);
		if(result == 0) {
			num = 0;
		} else if(result == 1) {
			num = 1;
		}
		
		out.print(num);
		out.flush();
		out.close();
	}

}
