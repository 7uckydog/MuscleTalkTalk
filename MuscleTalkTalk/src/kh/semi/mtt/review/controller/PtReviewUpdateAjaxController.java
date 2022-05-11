package kh.semi.mtt.review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.semi.mtt.review.model.service.ReviewService;
import kh.semi.mtt.review.model.vo.ReviewVo;

/**
 * Servlet implementation class PtReviewUpdateAjaxController
 */
@WebServlet("/reviewupdate.ax")
public class PtReviewUpdateAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtReviewUpdateAjaxController() {
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
		System.out.println("/reviewupdate.ax 들어옴");
		
		String ptNoStr = request.getParameter("ptNo");
		String memberNoStr = request.getParameter("memberNo");
		String reviewContent = request.getParameter("reviewContent");
		String reviewNoStr = request.getParameter("reveiwNo");
		int ptNo = 0;
		int memberNo = 0;
		int reviewNo = 0;
		try {
			ptNo = Integer.parseInt(ptNoStr);
			memberNo = Integer.parseInt(memberNoStr);
			reviewNo = Integer.parseInt(reviewNoStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		ReviewVo rVo = new ReviewVo();
		rVo.setMemberNo(memberNo);
		rVo.setPtNo(ptNo);
		rVo.setReviewContent(reviewContent);
		rVo.setReviewNo(reviewNo);
		int result = new ReviewService().updateReview(rVo);
		PrintWriter out = response.getWriter();
		Gson gobj = new GsonBuilder().setPrettyPrinting().create();
		String jsonOut = "";
		if(result == 1) {
			rVo = new ReviewService().readOneReview(rVo);
			jsonOut = gobj.toJson(rVo);
			
		} else {
			jsonOut = gobj.toJson("fail");
		}
		out.print(jsonOut);
		out.flush();
		out.close();
	}

}
