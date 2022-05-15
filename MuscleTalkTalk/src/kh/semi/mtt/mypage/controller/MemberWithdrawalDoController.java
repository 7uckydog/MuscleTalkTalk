package kh.semi.mtt.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.member.model.vo.TestTempVo;
import kh.semi.mtt.member.model.vo.WithdrawVo;
import kh.semi.mtt.reservation.model.service.ReservationService;
import kh.semi.mtt.trainer.model.service.TrainerService;

/**
 * Servlet implementation class MemberWithdrawalController
 */
@WebServlet("/memberwithdrawal.ax")
public class MemberWithdrawalDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberWithdrawalDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("WEB-INF/view/testsyb/mypage_withdrawal.jsp").forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		MemberVo ssMvo = (MemberVo)request.getSession().getAttribute("ssMvo");
		String memberId = ssMvo.getMemberId();
		int memberNo = ssMvo.getMemberNo();
		String memberPassword = request.getParameter("memberPassword");
		String memberTrainer = ssMvo.getMemberTrainer();
		
		int num = -1;
		int result = -1;
		int result2= -1;
		TestTempVo ttvo = null;

		if(memberTrainer.equals("F")|| memberTrainer.equals("R")) {
			result = new MemberService().withdrawal(memberId, memberPassword);
			result2 = new ReservationService().cancelReservation2(memberNo);
			
			if(result == 0 || result2 == -1) {
				System.out.println("회원 탈퇴 실패");
				num = 0;
			}else if(result == 1 || result2 >= 0) {
				System.out.println(result2);
				System.out.println("회원 탈퇴 성공");
				num = 1;
			}
		}
		else if (memberTrainer.equals("T")) {
			ttvo = new TrainerService().deleteTrainer(memberNo);
			if(ttvo.getResult() == 0) {
				System.out.println("트레이너 탈퇴 / 탈퇴 예약 실패");
				num = 0;
			} else if (ttvo.getResult() >= 1) {
				if(ttvo.getNum() == 1) {
					System.out.println("예약 프로그램이 있는 트레이너의 탈퇴 예약 완료");
					MemberVo Nvo = new MemberService().readOneMember(memberId);
					request.getSession().removeAttribute("ssMvo");
					request.getSession().setAttribute("ssMvo", Nvo);
					num = 2;
				} else if(ttvo.getNum()==2) {
					System.out.println("예약 프로그램이 없는 트레이너의 탈퇴 완료");
					num = 3;
				}
			}
		}
		out.print(num);
		out.flush();
		out.close();
	}

}
