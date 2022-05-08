package kh.semi.mtt.blacklist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.blacklist.model.service.BlacklistService;
import kh.semi.mtt.blacklist.model.vo.BlackistVo;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class BlacklistReadAllConroller
 */
@WebServlet("/blacklist")
public class BlacklistReadAllConroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlacklistReadAllConroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/blacklist 들어옴");
		MemberVo vo = (MemberVo)request.getSession().getAttribute("ssMvo");
		System.out.println(vo);
		if(vo == null) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		if(vo.getMemberTrainer().equals("F")) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		ArrayList<BlackistVo> blackList = new BlacklistService().readBlacklist(vo.getTrainerNo());
		System.out.println("/blacklist result blacklist : " + blackList);
		request.setAttribute("blackListArray", blackList);
		request.getRequestDispatcher("WEB-INF/view/ptpage/blacklist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}

}
