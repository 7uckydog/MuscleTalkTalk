package kh.semi.mtt.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/trainerreject")
public class AdminTrainerRejectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTrainerRejectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVo vo = new MemberVo();
		String memberTrainer = request.getParameter("memberTrainer");
		String trainerConfirm = request.getParameter("trainerConfirm");
		String memberNoStr = request.getParameter("memberNo");
		
		int memberNo = 0;
		
		try {
			memberNo = Integer.parseInt(memberNoStr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		vo.setMemberNo(memberNo);
		vo.setTrainerConfirm(trainerConfirm);
		vo.setMemberTrainer(memberTrainer);
		int result = new MemberService().rejectTrainer(memberNo);
		PrintWriter writer = response.getWriter();
		
		if(result < 1) { //트레이너 반려 실패
			writer.println("<script>alert('트레이너 반려에 실패했습니다.'); location.href = 'admintrainer'</script>");
			writer.flush();
			writer.close();
		} else { // 트레이너 반려ㅕ 성공
			writer.println("<script>alert('트레이너 반려를 완료했습니다.'); location.href = 'admintrainer'</script>");
			writer.flush();
			writer.close();
		}
	}

}
