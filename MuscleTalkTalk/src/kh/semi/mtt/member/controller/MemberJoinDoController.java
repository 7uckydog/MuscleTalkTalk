package kh.semi.mtt.member.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.semi.mtt.member.model.service.MemberService;
import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.member.model.vo.TrainerVo;
import kh.semi.mtt.trainer.model.service.TrainerService;

/**
 * Servlet implementation class MemberJoinDoController
 */
@WebServlet("/memberjoin.do")
public class MemberJoinDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinDoController() {
        super();
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
		
		// 사진처리
		String fileSavaPath = "upload/images/pt_trainer";
		String uploadPath = getServletContext().getRealPath(fileSavaPath);
		int maxFileSize = 50*1000*1000;
		String rootPath = getServletContext().getRealPath("/");

		File path = new File(uploadPath);
		if(!path.exists()) {
			path.mkdirs();
		}
		
		MultipartRequest multi = new MultipartRequest(request
				, uploadPath
				, maxFileSize
				, "UTF-8" 
				, new DefaultFileRenamePolicy());
		
		String orgFileName = multi.getOriginalFileName("file_upload");
		String type = multi.getContentType("file_upload");
		String upload = multi.getFilesystemName("file_upload");
		
		String filePath = "";
		String member_trainer = multi.getParameter("trainer_join");
		if(member_trainer != null || member_trainer != "") {
			filePath = fileSavaPath + "/" + upload;
			System.out.println(filePath);
		}
		
		// 회원가입 정보 처리
		String member_id = multi.getParameter("member_id");
		String member_password = multi.getParameter("member_password");
		String member_nickname = multi.getParameter("member_nickname");
		String member_email = multi.getParameter("member_email");
		String member_name = multi.getParameter("member_name");
		String member_phone = multi.getParameter("member_phone");
		String member_gender = multi.getParameter("member_gender");
		int member_age = -1;
		int member_height = -1;
		int member_weight = -1;
		try {
			member_age = Integer.parseInt(multi.getParameter("member_age"));
			member_height = Integer.parseInt(multi.getParameter("member_height"));
			member_weight = Integer.parseInt(multi.getParameter("member_weight"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		int member_purpose = -1;
		switch(multi.getParameter("member_purpose")) {
			case "선택안함" :
				member_purpose = 1; 
				break;
			case "감량":
				member_purpose = 2;
				break;
			case "증량":
				member_purpose = 3;
				break;
			case "체력관리":
				member_purpose = 4;
				break;
			case "바디프로필":
				member_purpose = 5;
				break;
			case "기타":
				member_purpose = 6;
				break;
			default : break;
		}
		int member_concern = -1;
			switch(multi.getParameter("member_concern")) {
			case "선택안함" :
				member_concern = 1; 
				break;
			case "웨이트트레이닝":
				member_concern = 2;
				break;
			case "필라테스":
				member_concern = 3;
				break;
			case "요가":
				member_concern = 4;
				break;
			case "기타":
				member_concern = 5;
				break;
			default : break;
		}
		String gym_name = multi.getParameter("gym_name");
		String gym_location = multi.getParameter("gym_location");
		
		MemberVo vo = new MemberVo();
		vo.setMemberId(member_id);
		vo.setMemberPassword(member_password);
		vo.setMemberEmail(member_email);
		vo.setMemberNickname(member_nickname);
		vo.setMemberName(member_name);
		vo.setMemberPhone(member_phone);
		vo.setMemberGender(member_gender);
		vo.setMemberAge(member_age);
		vo.setMemberHeight(member_height);
		vo.setMemberHeight(member_height);
		vo.setMemberPurpose(member_purpose);
		vo.setMemberConcern(member_concern);
		vo.setMemberTrainer(member_trainer);
		
		TrainerVo tvo = new TrainerVo();
		tvo.setTrainerFile(filePath);
		tvo.setGymName(gym_name);
		tvo.setGymLocation(gym_location);
		System.out.println(tvo);
		
		if(member_trainer != "" && member_trainer != null) {
			System.out.println("트레이너 회원가입 하러 가장");
			int result = new TrainerService().insertTrainer(vo, tvo);
			System.out.println("회원가입 성공 아싸라비아");
			response.sendRedirect("movetowhite");
//			request.getRequestDispatcher("WEB-INF/view/member/login.jsp").forward(request, response);
		} else {
			System.out.println("그냥 회원가입 하러 가장");
			int result = new MemberService().insertMember(vo);
			response.sendRedirect("movetowhite");
		}

	}

}
