package kh.semi.mtt.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.mtt.member.model.dao.MemberDao;
import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class MemberUpdateProfileController
 */
@WebServlet("/memberupdateprofile.ax")
public class MemberUpdateProfileDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateProfileDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("WEB-INF/view/testsyb/mypage_update.jsp").forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out  = response.getWriter();
		String memberId = request.getParameter("memberId");
		String memberNickname = request.getParameter("memberNickname");
		String memberEmail = request.getParameter("memberEmail");
		String memberPhone = request.getParameter("memberPhone");
		String memberAgeStr = request.getParameter("memberAge");
		String memberHeightStr = request.getParameter("memberHeight");
		String memberWeightStr = request.getParameter("memberWeight");
		String memberPurposeStr = request.getParameter("memberPurpose");
		String memberConcernStr = request.getParameter("memberConcern");
		int memberAge = -1;
		int memberHeight = -1;
		int memberWeight = -1;
		int memberPurpose = -1;
		int memberConcern = -1;
		try {
			memberAge = Integer.parseInt(memberAgeStr);
			memberHeight = Integer.parseInt(memberHeightStr);
			memberWeight = Integer.parseInt(memberWeightStr);
			memberPurpose = Integer.parseInt(memberPurposeStr);
			memberConcern = Integer.parseInt(memberConcernStr);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		MemberVo vo = new MemberVo();
		vo.setMemberId(memberId);
		vo.setMemberNickname(memberNickname);
		vo.setMemberEmail(memberEmail);
		vo.setMemberPhone(memberPhone);
		vo.setMemberAge(memberAge);
		vo.setMemberHeight(memberHeight);
		vo.setMemberWeight(memberWeight);
		vo.setMemberPurpose(memberPurpose);
		vo.setMemberConcern(memberConcern);
		System.out.println(vo);
		
		int result = new MemberService().updateMember(vo);
		
		if(result == 0) {
			System.out.println("회원정보 수정 실패");
		} else {
			MemberVo Nvo = new MemberService().readOneMember(vo.getMemberId());
			
			request.getSession().removeAttribute("ssMvo");
			request.getSession().setAttribute("ssMvo", Nvo);
		}
		out.flush();
		out.close();
	}
}
