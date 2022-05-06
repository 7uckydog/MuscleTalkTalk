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

/**
 * Servlet implementation class MyPtProgramController
 */
@WebServlet("/myptprogram")
public class MyPtProgramController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPtProgramController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/myptprogram 들어옴");
		MemberVo vo = (MemberVo)request.getSession().getAttribute("ssMvo");
		if(vo == null) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		ArrayList<PtVo> ptVoList = new PtService().readMyPt(vo.getTrainerNo());
		request.setAttribute("ptVoList", ptVoList);
		request.getRequestDispatcher("WEB-INF/view/ptpage/myptpage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
