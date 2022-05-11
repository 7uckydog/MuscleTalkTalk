package kh.semi.mtt.pt.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.blacklist.model.service.BlacklistService;
import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.pt.model.service.PtService;
import kh.semi.mtt.pt.model.vo.PtVo;

/**
 * Servlet implementation class PtReadController
 */
@WebServlet("/ptread")
public class PtReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtReadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/ptread Controller 호출됨");
		String ptNoStr = request.getParameter("ptNo");
		System.out.println("/ptread ptNo : " + ptNoStr);
		int ptNo = -1;
		if(ptNoStr != "0" && ptNoStr != null) {
			try {
				ptNo = Integer.parseInt(ptNoStr);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		PtVo pVo = new PtService().readPt(ptNo);
		System.out.println("/ptread pVo 결과:: " + pVo);
		if(pVo.getPtDelete().equals("T")) {
			response.sendRedirect("ptlist");
		}
		String myPtPageChk = "N";
		MemberVo mVo = (MemberVo) request.getSession().getAttribute("ssMvo");
		if(mVo != null) {
			if(mVo.getMemberTrainer().equals("T")) {
				if(new PtService().myPt(mVo.getTrainerNo(), ptNo) != 0) {
					myPtPageChk = "Y";
				}
			}
		}
		ArrayList<Integer> blacklistMember = new BlacklistService().blacklistMember(ptNo);
		request.setAttribute("pVo", pVo);
		request.setAttribute("blacklistMember", blacklistMember);
		request.setAttribute("myPtPageChk", myPtPageChk);
		request.getRequestDispatcher("WEB-INF/view/ptpage/ptread.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
