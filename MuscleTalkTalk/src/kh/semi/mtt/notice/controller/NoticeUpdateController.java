package kh.semi.mtt.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.notice.model.service.NoticeService;
import kh.semi.mtt.notice.model.vo.NoticeVo;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/noticeupdate")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeNoStr = request.getParameter("noticeNo");
		int noticeNo = 0;
		try {
			noticeNo = Integer.parseInt(noticeNoStr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(noticeNo <1) {
			//오류 페이지 또는 boardlist
			response.sendRedirect("noticereadall");
			return;
		}
		NoticeVo result = new NoticeService().readNotice(noticeNo);
		System.out.println(result);
		result.setNotiContent(result.getNotiContent().replaceAll("(\r\n|\n)", "<br>"));
		result.setNotiContent(result.getNotiContent().replaceAll(" ", "&nbsp;"));
		System.out.println(result);
		request.setAttribute("nvo", result);
		request.getRequestDispatcher("WEB-INF/view/board/notice/notiupdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
