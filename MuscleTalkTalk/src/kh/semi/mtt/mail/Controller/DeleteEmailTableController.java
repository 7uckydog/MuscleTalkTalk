package kh.semi.mtt.mail.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.mtt.mail.model.service.EmailService;

/**
 * Servlet implementation class DeleteEmailTableController
 */
@WebServlet("/deleteemailtablecontroller")
public class DeleteEmailTableController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmailTableController() {
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
		PrintWriter out  = response.getWriter();

		String emailCertificationEmail = request.getParameter("member_email");
		int result = new EmailService().deleteTableInfo2(emailCertificationEmail);
		
		if(result > 0) {
			System.out.println("취소로 삭제 완료");
		}
		else {
			System.out.println("삭제 실패");
		}
		out.flush();
		out.close();
	}

}
