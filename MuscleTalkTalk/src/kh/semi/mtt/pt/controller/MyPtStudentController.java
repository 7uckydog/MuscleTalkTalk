package kh.semi.mtt.pt.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.pt.model.service.PtService;
import kh.semi.mtt.pt.model.vo.PtVo;
import kh.semi.mtt.ptcalendar.model.service.PtCalendarService;
import kh.semi.mtt.ptcalendar.model.vo.PtCalendarVo;

/**
 * Servlet implementation class MyPtStudentController
 */
@WebServlet("/myptstudent")
public class MyPtStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPtStudentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/myptstudent 들어옴");
		MemberVo vo = (MemberVo)request.getSession().getAttribute("ssMvo");
		System.out.println(vo);
		if(vo == null) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		if(vo.getMemberTrainer().equals("F")) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		ArrayList<PtCalendarVo> ptCalVoList = new PtCalendarService().readMyStudent(vo.getTrainerNo());
		request.setAttribute("ptCalVoList", ptCalVoList);
		request.getRequestDispatcher("WEB-INF/view/ptpage/myptstudent.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
