package kh.semi.mtt.routineboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.routineboard.model.service.RoutineBoardService;
import kh.semi.mtt.routineboard.model.vo.RoutineBoardVo;

/**
 * Servlet implementation class InsertRourineBoardController
 */
@WebServlet("/insertroutineboard")
public class InsertRourineBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRourineBoardController() {
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


    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String rNostr = request.getParameter("routineNo");
		String rName = request.getParameter("routineName");
		String rMemo = request.getParameter("routineMemo");
		
		System.out.println("공유에이작스에서 가져옴no");
		System.out.println(rNostr);
		
		System.out.println("공유에이작스에서 가져옴name");
		System.out.println(rName);
		
		System.out.println("공유에이작스에서 가져옴memo");
		System.out.println(rMemo);
		
		
		int rNoInt = 0;
		rNoInt = Integer.parseInt(rNostr);
		
		RoutineBoardVo rvo = new RoutineBoardVo();
		MemberVo mvo = (MemberVo) request.getSession().getAttribute("ssMvo");
		
		rvo.setRoutineNo(rNoInt);
		rvo.setRoutineboardTitle(rName);
		rvo.setRoutineboardContent(rMemo);
		
		int result = new RoutineBoardService().insertRoutineboard(rvo, mvo);
		
		if(result < 1) { //글등록 실패
			response.sendRedirect("myroutinelistall");
			System.out.println("루틴게시글 등록실패");
		}else { // 글등록
			response.sendRedirect("routineboardreadall");
			System.out.println("루틴게시글 등록성공");
		}
		
		
		//int = new
		
		
		
		
		
	}

}
