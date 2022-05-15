package kh.semi.mtt.myroutine.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.routine.model.service.RoutineService;

/**
 * Servlet implementation class MyRoutineReadAjaxController
 */
@WebServlet("/myroutineread.ax")
public class MyRoutineReadAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyRoutineReadAjaxController() {
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
		System.out.println("/myroutineread.ax enter");
		
		
		MemberVo mvo = (MemberVo) request.getSession().getAttribute("ssMvo");
		
		Map<String, Object> result = new RoutineService().myRoutineReadAll(mvo);
		
		
		PrintWriter out = response.getWriter();
		Gson gobj = new GsonBuilder().setPrettyPrinting().create();
		String jsonOut = gobj.toJson(result);
		out.print(jsonOut);
		out.flush();
		out.close();
	}

}
