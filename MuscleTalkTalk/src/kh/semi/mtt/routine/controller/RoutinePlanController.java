package kh.semi.mtt.routine.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.routine.model.service.RoutineService;

/**
 * Servlet implementation class RoutinePlanController
 */
@WebServlet("/routineplan.ax")
public class RoutinePlanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoutinePlanController() {
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
		System.out.println("/routineplan.ax enter");
		
		String[] routineExerciseNoArray = request.getParameterValues("sendroutineExerciseNo");
		String[] routineExerciseDDayArray = request.getParameterValues("sendroutineExerciseDDay");
		ArrayList<Integer> routineExerciseNoList = new ArrayList<Integer>();
		ArrayList<String> routineExerciseDDayList = new ArrayList<String>();
		for(int i=0; i<routineExerciseNoArray.length; i++) {
			try {
				routineExerciseNoList.add(Integer.parseInt(routineExerciseNoArray[i]));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		for(int i=0; i<routineExerciseDDayArray.length; i++) {
			routineExerciseDDayList.add(routineExerciseDDayArray[i]);
		}

		int result = new RoutineService().routinePlan(routineExerciseNoList, routineExerciseDDayList);
		
		PrintWriter out = response.getWriter();
		if(result == 0) {
			System.out.println("routineplan.ax fail");
		} else {
			System.out.println("routineplan.ax success");
		}
		out.print(result);
		out.flush();
		out.close();
		
	}

}
