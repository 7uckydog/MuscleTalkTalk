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
import kh.semi.mtt.ptfavorite.model.service.PtFavoriteService;
import kh.semi.mtt.ptfavorite.model.vo.PtFavoriteVo;

/**
 * Servlet implementation class PtListController
 */
@WebServlet("/ptlist")
public class PtListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("/ptlist doGet 방식 호출");
		ArrayList<PtVo> ptVoList = new PtService().readAllPt();
		System.out.println("/ptlist doGet ptVoList 결과:  " + ptVoList);
		ArrayList<PtFavoriteVo> ptFavoriteVoList = null;
		if(request.getSession().getAttribute("ssMvo") != null) {
			int memberNo = 0;
			try {
				memberNo = ((MemberVo)request.getSession().getAttribute("ssMvo")).getMemberNo();
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			ptFavoriteVoList = new PtFavoriteService().readAllPtFavorite(memberNo);
		}
		System.out.println("/ptlist doGet ptFavoriteVoList 결과:  " + ptFavoriteVoList);
		request.setAttribute("ptVoList", ptVoList);
		request.setAttribute("ptFavoriteVoList", ptFavoriteVoList);
		request.getRequestDispatcher("WEB-INF/view/ptpage/ptlistpage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
