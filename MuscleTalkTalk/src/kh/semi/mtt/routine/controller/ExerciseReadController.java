package kh.semi.mtt.routine.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.semi.mtt.exercise.model.service.ExerciseService;
import kh.semi.mtt.exercise.model.vo.ExerciseVo;
import kh.semi.mtt.routine.model.service.RoutineService;

/**
 * Servlet implementation class exercisereadboardcontroller
 */
@WebServlet("/exerciseread")
public class ExerciseReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExerciseReadController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("루틴생성 부위에이작스");

		String tagetValStr = request.getParameter("tagetValue");
		

		PrintWriter out = response.getWriter();
		
		ArrayList<ExerciseVo> evoList = new ExerciseService().exerciseRead(tagetValStr);
		Gson gobj = new GsonBuilder().setPrettyPrinting().create();
		String outJson = gobj.toJson(evoList);
//		System.out.println(outJson);
		out.println(outJson);
		out.flush();
		out.close();
	}

}
