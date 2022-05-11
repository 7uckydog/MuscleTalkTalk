package kh.semi.mtt.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
				"cloud_name", "dfam8azdg",
				"api_key", "882165332977633",
				"api_secret", "lrdbmfClWzNqybNeqXyEoRpFmfg",
				"secure", true));
		PrintWriter out  = response.getWriter();
		System.out.println("memberupdateprofile.ax 진입");
		String fileSavePath = "upload";
		String uploadPath = getServletContext().getRealPath(fileSavePath);
		File path = new File(uploadPath);
		if(!path.exists()) {
			path.mkdirs();
		}
		
		System.out.println("dsad ");
		int maxFileSize = 50*1000*1000;
		MultipartRequest multi = new MultipartRequest(request
				, uploadPath
				, maxFileSize
				, "UTF-8" 
				, new DefaultFileRenamePolicy());
		String memberBool = multi.getParameter("bool");
		String memberId = multi.getParameter("memberId");
		String memberNickname = multi.getParameter("memberNickname");
		String memberEmail = multi.getParameter("memberEmail");
		String memberPhone = multi.getParameter("memberPhone");
		String memberAgeStr = multi.getParameter("memberAge");
		String memberHeightStr = multi.getParameter("memberHeight");
		String memberWeightStr = multi.getParameter("memberWeight");
		String memberPurposeStr = multi.getParameter("memberPurpose");
		String memberConcernStr = multi.getParameter("memberConcern");
		String memberFileName = multi.getFilesystemName("file");
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
		int result = -1;
		
		if(memberBool.equals("true")) {
			File cloudinaryFile = new File(uploadPath + "\\" + memberFileName);
			Map uploadResult = cloudinary.uploader().upload(cloudinaryFile, ObjectUtils.emptyMap());
			String memberPhoto = (String) uploadResult.get("url");
			vo.setMemberPhoto(memberPhoto);
			result = new MemberService().updateMember(vo);
		} else if(memberBool.equals("false")) {
			result = new MemberService().updateMember2(vo);
			System.out.println("변경 후 " + vo.getMemberHeight());
		}

		
		if(result == 0) {
			System.out.println("회원정보 수정 실패");
		} else {
			MemberVo Nvo = new MemberService().readOneMember(vo.getMemberId());
			
			request.getSession().removeAttribute("ssMvo");
			request.getSession().setAttribute("ssMvo", Nvo);
			System.out.println("되돌아가기 전 " + Nvo.getMemberHeight());
		}
		out.flush();
		out.close();
	}
}
