package kh.semi.mtt.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.common.function.PagingController;
import kh.semi.mtt.common.function.PagingVo;
import kh.semi.mtt.member.model.vo.TrainerVo;
import kh.semi.mtt.trainer.model.service.TrainerService;

/**
 * Servlet implementation class AdminMemberController
 */
@WebServlet("/admintrainer")
public class AdminTrainerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private TrainerService service = new TrainerService(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTrainerController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request = exec(request, response);
		request.getRequestDispatcher("WEB-INF/view/admin/admintrainer.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
	private int countTrainer() {
		int result = service.countTrainer();
		return result;
	}
	
	private HttpServletRequest exec(HttpServletRequest request, HttpServletResponse response) {
		HttpServletRequest resultRequest = null;
		int totalCnt = new TrainerService().countTrainer();
		PagingVo setVo = new PagingVo(10, 5, request.getParameter(""), request.getParameter("page"), totalCnt);
		PagingVo pageVo = new PagingController().setPagingValue(setVo);
		System.out.println("pageVo:" + pageVo);
		
		ArrayList<TrainerVo> result = service.readAllTrainer(pageVo.getStartRnum(), pageVo.getEndRnum(), pageVo.getSearch());
		System.out.println("exec에서 result"+result);

		request.setAttribute("trainerreadall", result);
		request.setAttribute("startPage", pageVo.getStartPage());
		request.setAttribute("endPage", pageVo.getEndPage());
		request.setAttribute("totalpageCnt", pageVo.getTotalpageCnt());
		request.setAttribute("currentPage", pageVo.getCurrentPage());
		resultRequest = request;
		return resultRequest;
	}

}
