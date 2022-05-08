package kh.semi.mtt.routine.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.routine.model.service.RoutineService;

/**
 * Servlet implementation class RoutineInsertAjaxController
 */
@WebServlet("/routineinsert.a")
public class RoutineInsertAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoutineInsertAjaxController() {
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
			System.out.println("루틴생성 부위에이작스 들어옴");
			System.out.println(request.getParameter("routine_nameBox"));
			String arr[] = request.getParameterValues("addworkoutset"); //세트
			String awn[] = request.getParameterValues("addworkoutname"); // 운동명
			String aws[] = request.getParameterValues("addworkoutsettingname"); // 횟수
			String aww[] = request.getParameterValues("addworkoutweight"); // 무게
			int arrint = 0;
			int awnint = 0;
			int awsint = 0;
			int awwint = 0;
			for(int i=0; i<arr.length; i++) {
				System.out.println("세트:"+arr[i]);
				 arrint = Integer.parseInt(arr[i]);
			}
			for(int i=0; i<awn.length; i++) {
				System.out.println("운동명:"+awn[i]);
				 awnint = Integer.parseInt(awn[i]);
			}
			for(int i=0; i<aws.length; i++) {
				System.out.println("횟수:"+aws[i]);
				 awsint = Integer.parseInt(aws[i]);
			}
			for(int i=0; i<aww.length; i++) {
				System.out.println("무게:"+aww[i]);
				 awwint = Integer.parseInt(aww[i]);
			}
			MemberVo mvo = (MemberVo) request.getSession().getAttribute("ssMvo");
			
	//		int result = new RoutineService().insertRoutine(arrint, awnint, awsint, awwint);
			PrintWriter out = response.getWriter();
			out.print("결과 넘어가냐");
			out.flush();
			out.close();
	}

}
