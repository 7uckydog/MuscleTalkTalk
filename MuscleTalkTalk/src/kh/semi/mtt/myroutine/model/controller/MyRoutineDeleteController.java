package kh.semi.mtt.myroutine.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.routine.model.service.RoutineService;
import kh.semi.mtt.routine.model.vo.RoutineVo;

/**
 * Servlet implementation class MyRoutineDeleteController
 */
@WebServlet("/deleteroutine")
public class MyRoutineDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyRoutineDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("루틴삭제 들어옴");
		int result = -1 ;
		RoutineVo rvo = new RoutineVo();
		
		rvo.setRoutineNo(Integer.parseInt(request.getParameter("routineno"))); 
		
		result = new RoutineService().MyRoutineDelete(rvo);
		if(result == 1) {
			System.out.println("삭제성공");
			response.sendRedirect("myroutinelistall");
		}
		
		
	}

	
	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
