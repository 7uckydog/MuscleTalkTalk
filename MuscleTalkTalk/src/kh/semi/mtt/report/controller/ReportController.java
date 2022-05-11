package kh.semi.mtt.report.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.report.model.service.ReportService;
import kh.semi.mtt.report.model.vo.ReportVo;

/**
 * Servlet implementation class ReportBoardController
 */
@WebServlet("/boardreport")
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("신고컨트롤러 들어옴");
		System.out.println();
		MemberVo mvo = (MemberVo) request.getSession().getAttribute("ssMvo");
		
	    String rCS = request.getParameter("reportContent");
		System.out.println(rCS);

		String bnoStr = request.getParameter("boardNo");
		System.out.println(bnoStr);
		
		int bnoint = 0;
		try {
			bnoint = Integer.parseInt(bnoStr);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		ReportVo rpvo = new ReportVo();
		
		rpvo.setBoardNo(bnoint);
		rpvo.setBoardReportContent(rCS);
		rpvo.setRoutineboardNo(0);
		
		int result = new ReportService().insertReport(rpvo, mvo);
		
		if(result <1) {
			System.out.println("신고실패");
		}else {
			System.out.println("신고성공");
		}
		
	}


	
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
