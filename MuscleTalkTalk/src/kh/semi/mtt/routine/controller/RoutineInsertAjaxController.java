package kh.semi.mtt.routine.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.routine.model.service.RoutineService;

/**
 * Servlet implementation class RoutineInsertAjaxController
 */
@WebServlet("/routineinsert.a")
public class RoutineInsertAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoutineInsertAjaxController() {
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
			System.out.println("루틴생성 부위에이작스 들어옴");
			System.out.println(request.getParameter("routine_nameBox"));
			String arr[] = request.getParameterValues("addworkoutset");
			for(int i=0; i<arr.length; i++) {
				System.out.println("arr"+arr[i]);
			}
//			String tagetValStr = request.getParameter("routine_nameBox");
//			try {
//				int tagetValInt = Integer.parseInt(tagetValStr);
//				System.out.println("부위에이작스 파스인트함");
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//			int result = new RoutineService().insertRoutine(vo, rouExerVoList);
			PrintWriter out = response.getWriter();
			out.print("결과 넘어가냐");
			out.flush();
			out.close();
	}

}
