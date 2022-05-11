package kh.semi.mtt.review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.review.model.service.ReviewService;

/**
 * Servlet implementation class PtReviewDeleteAjaxController
 */
@WebServlet("/reviewdelete.ax")
public class PtReviewDeleteAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtReviewDeleteAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/reviewdelete.ax 들어옴");
		
		String reviewNoStr = request.getParameter("reveiwNo");
		int reviewNo = 0;
		try {
			reviewNo = Integer.parseInt(reviewNoStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		int result = new ReviewService().deleteReview(reviewNo);
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
		out.close();
		
	}

}
