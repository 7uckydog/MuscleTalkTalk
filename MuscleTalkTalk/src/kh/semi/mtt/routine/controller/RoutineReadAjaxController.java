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
 * Servlet implementation class RoutineReadAjaxController
 */
@WebServlet("/routineread.ax")
public class RoutineReadAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoutineReadAjaxController() {
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
		System.out.println("routineread.ax");
		
		String routineNoStr = request.getParameter("routineNo");
		String dayTemp = request.getParameter("dayTemp");
		String weekTemp = request.getParameter("weekTemp");
		
		int routineNo = 0;
		int day = 0;
		int week = 0;
		
		System.out.println(routineNoStr);
		System.out.println(dayTemp);
		System.out.println(weekTemp);
		
		try {
			routineNo = Integer.parseInt(routineNoStr);
			day = Integer.parseInt(dayTemp);
			week = Integer.parseInt(weekTemp);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		new RoutineService();
		
		PrintWriter out = response.getWriter();
		
		out.print("success");
		out.flush();
		out.close();
		
	}

}
