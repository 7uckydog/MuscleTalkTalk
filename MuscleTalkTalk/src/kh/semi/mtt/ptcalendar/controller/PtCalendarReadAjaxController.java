package kh.semi.mtt.ptcalendar.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.semi.mtt.ptcalendar.model.service.PtCalendarService;
import kh.semi.mtt.ptcalendar.model.vo.PtCalendarVo;

/**
 * Servlet implementation class PtCalendarReadAjaxController
 */
@WebServlet("/ptcalread.ax")
public class PtCalendarReadAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtCalendarReadAjaxController() {
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
		System.out.println("/ptcalread.ax enter");
		
		String ptCalNoStr = request.getParameter("ptCalNoTemp");
		System.out.println(ptCalNoStr);
		int ptCalendarNo = 0;
		try {
			ptCalendarNo = Integer.parseInt(ptCalNoStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		PtCalendarVo result = new PtCalendarService().readOneReservation(ptCalendarNo);
		
		Gson gobj = new GsonBuilder().setPrettyPrinting().create();
		
		String jsonOut = gobj.toJson(result);
		
		PrintWriter out = response.getWriter();
		
		
		out.print(jsonOut);
		out.flush();
		out.close();
	}

}
