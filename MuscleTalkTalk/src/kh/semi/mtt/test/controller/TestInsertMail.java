package kh.semi.mtt.test.controller;

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

import kh.semi.mtt.member.model.vo.EmailVo;

/**
 * Servlet implementation class TestInsertMail
 */
@WebServlet("/insertmail")
public class TestInsertMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestInsertMail() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out  = response.getWriter();

		String emailCertificationEmail = request.getParameter("email_certification_email");
		int result = new EmailService().insertNumber(emailCertificationEmail);
		
		if(result == 0) {
			System.out.println("insert 실패");
		} else{
			System.out.println("insert 성공");
		}
//		out.print(result);
		out.flush();
		out.close();
	}

}
