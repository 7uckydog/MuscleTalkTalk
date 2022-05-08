package kh.semi.mtt.ptfavorite.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.ptfavorite.model.service.PtFavoriteService;

/**
 * Servlet implementation class PtFavoriteAjaxController
 */
@WebServlet("/ptfavorite.ax")
public class PtFavoriteAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtFavoriteAjaxController() {
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
		System.out.println("/ptfavorite.ax에 들어옴");
		PrintWriter out = response.getWriter();
		
		String memberNoStr = request.getParameter("memberNo");
		String ptNoStr = request.getParameter("ptNo");
		String favoriteCheck = request.getParameter("favoriteCheck");
		int memberNo = 0;
		int ptNo = 0;
		try {
			memberNo = Integer.parseInt(memberNoStr);
			ptNo = Integer.parseInt(ptNoStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		int result = 0;
		if(favoriteCheck.equals("false")) {			
			System.out.println("/ptfavorite.ax에서 insertPtFavorite");
			result = new PtFavoriteService().insertPtFavorite(memberNo, ptNo);
		} else if(favoriteCheck.equals("true")) {
			System.out.println("/ptfavorite.ax에서 deletePtFavorite");
			result = new PtFavoriteService().deletePtFavorite(memberNo, ptNo);
		}
		if(result == 1) {
			System.out.println("/ptfavorite.ax success");
		} else {			
			System.out.println("/ptfavorite.ax fail");
		}
		out.print(result);
		
		out.flush();
		out.close();
	}

}
