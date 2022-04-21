package kh.semi.mtt.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.notice.model.service.NoticeService;
import kh.semi.mtt.notice.model.vo.NoticeVo;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/noticereadall")
public class NoticeReadAllController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService service = new NoticeService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeReadAllController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1;
		
		String currentPageStr = request.getParameter("page");
		try {
//			if(currentPageStr = request.getParameter("page"){
//				
//			})
			currentPage = Integer.parseInt(currentPageStr);
		}catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		final int pageSize = 5;    //한페이지에 보여줄 행
		final int pageBlock = 3;  //페이징에 나타날 페이지수
		
		int startPage=0;
		int endPage=0;
		int startNnum=0;
		int endNnum=0;
		
		int totalCnt = 0; // 총 글 수 
		totalCnt = countNotice();
		System.out.println("총"+totalCnt);
//		select count(*) from board
		
		//paging 처리
		int totalPageCnt = (totalCnt/pageSize) + (totalCnt%pageSize==0 ? 0 : 1);
		if(currentPage%pageBlock==0) {
			startPage = ((currentPage/pageBlock)-1)*pageBlock + 1;
		} else {
			startPage = (currentPage/pageBlock)*pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if(endPage>totalPageCnt) {
			endPage = totalPageCnt;
		}
		System.out.println("page: "+ startPage +"~"+ endPage);
		
		/* rownum 처리*/
		startNnum = (currentPage-1)*pageSize+1;
		endNnum = startNnum+pageSize -1;
		if(endNnum>totalCnt) {
			endNnum = totalCnt;
		}
		System.out.println("rnum:"+ startNnum + "~"+endNnum);
		
		ArrayList<NoticeVo> result = service.readAllNotice(startNnum, endNnum);
		System.out.println(result);
		
		request.setAttribute("boardlist", result);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPageCnt", totalPageCnt);
		request.getRequestDispatcher("WEB-INF/view/board/notice/notilist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
	
	private int countNotice() {   //view에서 호출할일 없고 컨트롤러에서만 계산할때 사용하기때문에 private가능
		int result =  service.countNotice();
		return result;
	}

}
