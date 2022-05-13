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
@WebServlet("/noticeupdate.do")
public class NoticeUpdateDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateDoController() {
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
		NoticeVo vo = new NoticeVo();
		String notiTitle = request.getParameter("notiTitle");   //앞에서 파라메타 인코딩 설정 해준다음에 읽어줘야함.
		String notiContent = request.getParameter("notiContent");
		String noticeNoStr = request.getParameter("noticeNo");
		System.out.println("noticeNOSTr:  " +noticeNoStr );
		int noticeNo = 0;
		
		try {
			noticeNo = Integer.parseInt(noticeNoStr);
		}catch(Exception e) {
			//오류상황이 아니라 글쓰기인 경우 bNoStr이 null.
		}
		
		vo.setNoticeNo(noticeNo);
		vo.setNotiTitle(notiTitle);
		vo.setNotiContent(notiContent);
		
		int result = -1;
		
		System.out.println("noticeNO Value: "+noticeNo);
		if(noticeNo>0) {
			System.out.println("업데이트전 bno:" + vo.getNoticeNo());
			System.out.println("업데이트 실행 ");
			result = new NoticeService().updateNotice(vo);
		} else {
			System.out.println("여기 들어왔나요/>/???");
			result = new NoticeService().insertNotice(vo);
		}
		
		if(result < 1) { //글수정 실패
			response.sendRedirect("noticeupdate");
		} else { //글수정 성공
			response.sendRedirect("noticereadall");
		}
	}

}
