package kh.semi.mtt.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.semi.mtt.board.model.service.BoardService;
import kh.semi.mtt.board.model.vo.BoardVo;
import kh.semi.mtt.comment.model.vo.CommentVo;

/**
 * Servlet implementation class MemberReadContentController
 */
@WebServlet("/memberreadcontent.ax")
public class MemberReadContentDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReadContentDoController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("WEB-INF/view/testsyb/mypage_content_read.jsp").forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Gson gobj = new GsonBuilder().setDateFormat("yyyy-MM-dd").setPrettyPrinting().create();

		String memberId = request.getParameter("member_id");
		String currentPageStr = request.getParameter("page");
		String button = request.getParameter("button");
		int buttonInt = 0;
		try {
			buttonInt = Integer.parseInt(button);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		int currentPage = 1;
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

		int totalCnt = 0; // 총 글수
		if(buttonInt == 1) {
			totalCnt = countBoard_member(memberId);
	
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
		
		// 게시물 조회
			ArrayList<BoardVo> volist = new BoardService().readOneMemberBoard(startRnum, endRnum, memberId);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberboard", volist);
			map.put("startPage", startPage);
			map.put("currentPage", currentPage);
			map.put("endPage", endPage);
			map.put("totalpageCnt", totalpageCnt);
			System.out.println(map);
			String listRes = gobj.toJson(map);
			System.out.println(listRes);
			
			out.print(listRes);
			out.flush();
			out.close();
			return;
		}
		
		// 댓글 조회
		if(buttonInt == 2) {
			totalCnt = countComment_member(memberId);

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
			if(endRnum < 1) {
				endRnum = 1;
			}
			System.out.println("startRnum & endRnum");
			System.out.println(startRnum);
			System.out.println(endRnum);
			ArrayList<CommentVo> volist = new BoardService().readOneMemberComment(startRnum, endRnum, memberId);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("membercomment", volist);
			map.put("startPage", startPage);
			map.put("currentPage", currentPage);
			map.put("endPage", endPage);
			map.put("totalpageCnt", totalpageCnt);
			System.out.println(map);
			String listRes = gobj.toJson(map);
			System.out.println(listRes);
			
			out.print(listRes);
			out.flush();
			out.close();
			return;
		}
	}
	
	
	private int countBoard_member(String memberId) {
		int result = new BoardService().countBoard_member(memberId);
		System.out.println(result);
		return result;
	}
	private int countComment_member(String memberId) {
		int result = new BoardService().countComment_member(memberId);
		System.out.println(result);
		return result;
	}
}
