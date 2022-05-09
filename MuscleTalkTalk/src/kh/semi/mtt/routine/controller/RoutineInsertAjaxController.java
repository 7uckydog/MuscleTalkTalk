package kh.semi.mtt.routine.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.routine.model.service.RoutineService;
import kh.semi.mtt.routine.model.vo.RoutineVo;
import kh.semi.mtt.routineexercise.model.vo.RoutineExerciseVo;

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
			MemberVo mvo = (MemberVo) request.getSession().getAttribute("ssMvo");
			System.out.println("루틴생성 부위에이작스 들어옴");
			System.out.println(request.getParameter("routine_nameBox"));
			String rnb = request.getParameter("routine_nameBox"); // 루틴명
			String arr[] = request.getParameterValues("addworkoutset"); //세트
			String awn[] = request.getParameterValues("addworkoutname"); // 운동명
			String aws[] = request.getParameterValues("addworkoutsettingname"); // 횟수
			String aww[] = request.getParameterValues("addworkoutweight"); // 무게
			String rw[] = request.getParameterValues("addworkoutDayweekinput"); // 주차 - 1주차 2주차..
			String rd[] = request.getParameterValues("addworkDay"); // 요일 - 월 화...
			String st = request.getParameter("settime"); // 세트시간
			String wt = request.getParameter("worktime"); // 운동시간
			String tg = request.getParameter("routine_tagetName"); // 루틴목표 - 다이어트, 근비대...
			String rm = request.getParameter("routineMemo");
			ArrayList<Integer> arrInt = new ArrayList<Integer>();
			ArrayList<String> awnStr = new ArrayList<String>();
			ArrayList<Integer> awsInt = new ArrayList<Integer>();
			ArrayList<Integer> awwInt = new ArrayList<Integer>();
			ArrayList<Integer> rwInt = new ArrayList<Integer>();
			ArrayList<Integer> rdInt = new ArrayList<Integer>();
			try {
				
				for(String tempStr : arr) {
					arrInt.add(Integer.parseInt(tempStr.substring(0, tempStr.length()-2)));
				}
				for(String tempStr : awn) {
					awnStr.add(tempStr);
				}
				for(String tempStr : aws) {
					awsInt.add(Integer.parseInt(tempStr.substring(0, tempStr.length()-1)));
				}
				for(String tempStr : aww) {
					awwInt.add(Integer.parseInt(tempStr.substring(0, tempStr.length()-2)));
				}
				for(String tempStr : rw) {
					rwInt.add(Integer.parseInt(tempStr.substring(0, tempStr.length()-2)));
				}
				for(String tempStr : rd) {
					int rdTemp = 0;
					switch (tempStr) {
					case "월":
						rdTemp = 1;
						break;
					case "화":
						rdTemp = 2;
						break;
					case "수":
						rdTemp = 3;
						break;
					case "목":
						rdTemp = 4;
						break;
					case "금":
						rdTemp = 5;
						break;
					case "토":
						rdTemp = 6;
						break;
					case "일":
						rdTemp = 7;
						break;

					default:	
						break;
					}
					rdInt.add(rdTemp);
				}
				
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			try {
				int stInt = Integer.parseInt(st.substring(0, st.length()-1));
				System.out.println("tst1111");
				System.out.println(wt);
				System.out.println(wt.substring(0, wt.length()-1));
				int wtInt = Integer.parseInt(wt.substring(0, wt.length()-1));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			System.out.println(rnb);//
			System.out.println(st);
			System.out.println(wt);
			System.out.println(tg);//
			System.out.println(rm);//
			System.out.println(rwInt);
			System.out.println(rdInt);
			System.out.println(arrInt);
			System.out.println(awnStr);
			System.out.println(awsInt);
			System.out.println(awwInt);
			
			RoutineVo routineVo = new RoutineVo();
			routineVo.setRoutineName(rnb);
			routineVo.setRoutineTarget(tg);
			routineVo.setRoutineContent(rm);
			
			ArrayList<RoutineExerciseVo> routineExerciseVoList = new ArrayList<RoutineExerciseVo>();
			for(int i = 0 ; i < rwInt.size(); i++) {
				RoutineExerciseVo reVo = new RoutineExerciseVo();
				
				reVo.setExerciseNo(1);
				reVo.setRoutineExerciseDay(rdInt.get(i));
				reVo.setRoutineWeek(rwInt.get(i));
				reVo.setRoutineExerciseSet(arrInt.get(i));
				reVo.setRoutineExerciseRepeat(awsInt.get(i));
				reVo.setRoutineExerciseWeight(awwInt.get(i));
				reVo.setExerciseName(awnStr.get(i));
//				reVo.setRoutineDay(routineDay);
				
				routineExerciseVoList.add(reVo);
			}
			
			
//			int result = new RoutineService().insertRoutine(arrInt, awnStr, awsInt, awwInt, rdInt, stInt, wtInt, tg);
//			int result = new RoutineService().insertRoutine(arrint, awnint, awsint, awwint);
			int result = new RoutineService().insertRoutine(routineVo, mvo, routineExerciseVoList);
			PrintWriter out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
	}

}
