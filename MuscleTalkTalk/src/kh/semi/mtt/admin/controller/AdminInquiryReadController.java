package kh.semi.mtt.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.inquiry.model.service.InquiryService;
import kh.semi.mtt.inquiry.model.vo.InquiryVo;

/**
 * Servlet implementation class AdminInquiryController
 */
@WebServlet("/admininquiryread")
public class AdminInquiryReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private InquiryService service = new InquiryService();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInquiryReadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String inquiryNoStr = request.getParameter("inquiryNo");
		int inquiryNo=0;
		String inquiryTitle = request.getParameter("inquiryTitle");
		
		try {
			inquiryNo = Integer.parseInt(inquiryNoStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		InquiryVo result = new InquiryService().readInquiryAdmin(inquiryTitle, inquiryNo);
//		result.setInquiryContent(result.getInquiryContent().replaceAll("(\r\n|\n)", "<br>")); 
//		result.setInquiryContent(result.getInquiryContent().replaceAll(" ", "&nbsp;")); 
		request.setAttribute("ivo", result);
		System.out.println("??????????????????");
		System.out.println(result);
		System.out.println("??????????????????");
		request.getRequestDispatcher("WEB-INF/view/admin/admininquiryread.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inquiryAnswer = request.getParameter("inquiryAnswer");
		String inquiryNoStr = request.getParameter("inquiryNo");
		int inquiryNo = -1;
		try {
			inquiryNo = Integer.parseInt(inquiryNoStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		InquiryVo vo = new InquiryVo();
		vo.setInquiryNo(inquiryNo);
		vo.setInquiryAnswer(inquiryAnswer);
		int result = new InquiryService().answerInquiry(vo);
		
		PrintWriter writer = response.getWriter();

		if(result<1) { // 등록실패
			writer.println("<script>alert('답변 등록에 실패했습니다.'); location.href = 'admininquiry'</script>");
			writer.flush();
			writer.close();
			//request.getRequestDispatcher("WEB-INF/view/admin/admininquiry.jsp").forward(request, response);
			//response.sendRedirect("admininquiry");
		} else {
			writer.println("<script>alert('답변 등록에 성공했습니다.'); location.href = 'admininquiry'</script>");
			writer.flush();
			writer.close();
			//request.getRequestDispatcher("WEB-INF/view/admin/admininquiry.jsp").forward(request, response);
			//response.sendRedirect("admininquiry");
		}
		
		
	}

}
