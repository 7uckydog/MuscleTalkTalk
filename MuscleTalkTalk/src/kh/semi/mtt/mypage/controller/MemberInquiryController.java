package kh.semi.mtt.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.board.model.service.BoardService;
import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.inquiry.model.service.InquiryService;
import kh.semi.mtt.inquiry.model.vo.InquiryVo;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class MemberInquiryController
 */
@WebServlet("/memberinquiry")
public class MemberInquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInquiryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVo ssMvo = (MemberVo)request.getSession().getAttribute("ssMvo");
		String memberId = ssMvo.getMemberId();
		System.out.println("아이디는?" + memberId);
		int currentPage = 1;
		
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

		int totalCnt = 0; // 회원의 총 게시물 수
		totalCnt = countInquiry_member(memberId);
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
		startRnum = (currentPage - 1) * pageSize + 1;
		endRnum = startRnum + pageSize - 1;
		if (endRnum > totalCnt) {
			endRnum = totalCnt;
		}

		System.out.println("rnum:" + startRnum + "~" + endRnum);
		ArrayList<InquiryVo> volist = new InquiryService().readOneMemberInquiry(startRnum, endRnum, memberId);
		System.out.println("왜");
		System.out.println(volist);
		request.setAttribute("memberinquiry", volist);
		request.setAttribute("startPage", startPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalpageCnt", totalpageCnt);
	
		request.getRequestDispatcher("WEB-INF/view/testsyb/mypage_inquiry.jsp").forward(request, response);
	}
	
	private int countInquiry_member(String memberId) {
		int result = new InquiryService().countInquiry_member(memberId);
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
