package kh.semi.mtt.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.notice.model.service.NoticeService;
import kh.semi.mtt.notice.model.vo.NoticeVo;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class BoardWriteDoController
 */
@WebServlet("/noticeinsert.do")
public class NoticeInsertDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertDoController() {
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
		System.out.println("doPost - boardwrite.do");
		
		//한글깨짐방지
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
		
		String notiTitle = request.getParameter("notiTitle");   //앞에서 파라메타 인코딩 설정 해준다음에 읽어줘야함.
		String notiContent = request.getParameter("notiContent");
		System.out.println(notiTitle);
		System.out.println(notiContent);
		
		NoticeVo vo = new NoticeVo();
		vo.setNotiContent(notiContent);
		vo.setNotiTitle(notiTitle);
		
//		//로그인상태 확인
//		MemberVo ssvo = (MemberVo) request.getSession().getAttribute("ssMV");
//		if (ssvo == null) { // 로그아웃 상태라면 login page 진입 
//			response.sendRedirect("login");
//			return;      //db에 write할필요x
//		} else {  // 로그인한 상태라면 write page 진입
//			vo.setmId(ssvo.getmId());
//			vo.setbWriter(ssvo.getmNickname());
//		}
		
		
		//db저장;    위에 else 안에 넣어줘도됨.
		int result = new NoticeService().insertNotice(vo);
		if(result < 1) { //글등록 실패
			response.sendRedirect("main");
		} else { //글등록 성공
			System.out.println("글등록 성공!");
			response.sendRedirect("main");
		}
		
		

	}

}
