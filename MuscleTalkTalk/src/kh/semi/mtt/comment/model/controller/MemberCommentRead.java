package kh.semi.mtt.comment.model.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.board.model.service.BoardService;
import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.comment.model.vo.CommentVo;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class MemberCommentRead
 */
@WebServlet("/memberCommentRead")
public class MemberCommentRead extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCommentRead() {
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
		int filter = 0;
		
		String currentPageStr = request.getParameter("page");
		try {
			if(currentPageStr !=null && !currentPageStr.equals(""))
			currentPage = Integer.parseInt(currentPageStr);
		}catch (NumberFormatException e) {
			e.printStackTrace();
		}

		final int pageSize = 8; // 한페이지에 보여줄 행
		final int pageBlock = 4; // 페이징에 나타날 페이지수
		int startPage = 0;
		int endPage = 0;
		int startRnum = 0;
		int endRnum = 0;

		int totalCnt = 0; // 회원의 총 댓글 수
		totalCnt = countComment_member(memberNo);
		System.out.println("총" + totalCnt);

		// Paging 처리
		int totalpageCnt = (totalCnt / pageSize) + (totalCnt % pageSize == 0 ? 0 : 1);
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > totalpageCnt) {
			endPage = totalpageCnt;
		}
		System.out.println("page:" + startPage + "~" + endPage);

		// rownum 처리
		startRnum = totalCnt - pageSize *(currentPage - 1);
		endRnum =  totalCnt - pageSize *(currentPage) + 1;
		if (endRnum < 1) {
			endRnum = 1;
		}

		System.out.println("rnum:" + startRnum + "~" + endRnum);
		ArrayList<CommentVo> volist = new BoardService().readOneMemberComment(startRnum, endRnum, memberNo);
		System.out.println(volist);
		request.setAttribute("membercomment", volist);
		request.setAttribute("startPage", startPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalpageCnt", totalpageCnt);
	
		request.getRequestDispatcher("WEB-INF/view/testsyb/mypage_content_read.jsp").forward(request, response);
	}
	
	private int countComment_member(int memberNo) {
		int result = new BoardService().countComment_member(memberNo);
		System.out.println(result);
		return result;
	}
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}


