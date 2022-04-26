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
 * Servlet implementation class InsertMailAndNumberForJoin
 */
@WebServlet("/insertmailforjoin")
public class InsertMailAndNumberForJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMailAndNumberForJoinController() {
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
		String emailCertificationEmail = request.getParameter("email_certification_email");
		
		int result = new EmailService().insertNumber(emailCertificationEmail);
		if(result == 0) {
			//insert실패
		} else{
			System.out.println("insert 성공");
			out.flush();
			out.close();
		}
		out.flush();
		out.close();
	}

}
