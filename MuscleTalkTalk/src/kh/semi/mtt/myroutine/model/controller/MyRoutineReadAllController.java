package kh.semi.mtt.myroutine.model.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.routine.model.service.RoutineService;

/**
 * Servlet implementation class MyRoutineListAllController
 */
@WebServlet("/myroutinelistall")
public class MyRoutineReadAllController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private RoutineService service = new RoutineService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyRoutineReadAllController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVo mvo = (MemberVo) request.getSession().getAttribute("ssMvo");
		
		Map<String, Object> result = service.myRoutineReadAll(mvo);
		
		request.setAttribute("rvolist",result.get("rvolist"));
		request.setAttribute("revolist",result.get("revolist"));
		request.setAttribute("evolist",result.get("evolist"));
		
		if(mvo !=null) {
			
			request.getRequestDispatcher("WEB-INF/view/myroutine/myroutinelist.jsp").forward(request, response);
		}else {
			
			request.getRequestDispatcher("WEB-INF/view/member/login.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
