package kh.semi.mtt.mail.Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import kh.semi.mtt.mail.model.service.EmailService;
import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.EmailVo;
import kh.semi.mtt.member.model.vo.MemberVo;

/**
 * Servlet implementation class TestInsertMail
 */
@WebServlet("/insertmail")
public class InsertMailAndNumberForIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMailAndNumberForIdController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out  = response.getWriter();
		String memberName = request.getParameter("member_name");
		String emailCertificationEmail = request.getParameter("email_certification_email");
		
		//아이디와 이메일의 정보가 있으면
		MemberVo vo = new MemberService().findIdfromNameAndEmail(memberName, emailCertificationEmail);
		if(vo == null) {
			request.getRequestDispatcher("findId.jsp").forward(request, response);
			return;
		} else {
			int result = new EmailService().insertNumber(emailCertificationEmail);
			if(result == 0) {
				//insert실패
			} else{
				System.out.println("insert 성공");
				out.flush();
				out.close();
			}
		}
//		out.print(result);
		out.flush();
		out.close();
	}

}
