package kh.semi.mtt.blacklist.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.blacklist.model.service.BlacklistService;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class BlacklistDeleteAjaxConroller
 */
@WebServlet("/blacklistdelete.ax")
public class BlacklistDeleteConroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlacklistDeleteConroller() {
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
		System.out.println("/blacklistdelete.ax 들어옴");
		MemberVo vo = (MemberVo)request.getSession().getAttribute("ssMvo");
		System.out.println(vo);
		if(vo == null) {
			response.sendRedirect(request.getContextPath() + "/");
			return;
		}
		if(vo.getMemberTrainer().equals("F")) {
			response.sendRedirect(request.getContextPath() + "/");
			return;
		}
		
		PrintWriter out = response.getWriter();
		String blacklistNoStr = request.getParameter("blacklistNo");
		if(blacklistNoStr == null) {
			out.print(0);
			
			out.flush();
			out.close();
		}
		int blacklistNo = 0;
		try {
			blacklistNo = Integer.parseInt(blacklistNoStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		int result = new BlacklistService().deleteBlacklist(blacklistNo);
		if(result == 1) {			
			out.print(1);
		} else {
			out.print(0);
		}
		
		out.flush();
		out.close();
		
		
	}

}
