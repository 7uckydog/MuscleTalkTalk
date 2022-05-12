package kh.semi.mtt.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.semi.mtt.member.model.vo.MemberVo;
import kh.semi.mtt.trainer.model.service.TrainerService;

/**
 * Servlet implementation class MemberSwitchToTrainerAccount
 */
@WebServlet("/memberDoswitchaccount")
public class MemberSwitchDoToTrainerAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSwitchDoToTrainerAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("WEB-INF/view/testsyb/mypage_switch_account.jsp").forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
				"cloud_name", "dfam8azdg",
				"api_key", "882165332977633",
				"api_secret", "lrdbmfClWzNqybNeqXyEoRpFmfg",
				"secure", true)
		);
		
		// 사진처리
		String fileSavePath = "upload";
		String uploadPath = getServletContext().getRealPath(fileSavePath);
		int maxFileSize = 50*1000*1000;
		
		File path = new File(uploadPath);
		if(!path.exists()) {
			path.mkdirs();
		}
		
		MultipartRequest multi = new MultipartRequest(request
				, uploadPath
				, maxFileSize
				, "UTF-8" 
				, new DefaultFileRenamePolicy()
		);
	
		String upload = multi.getFilesystemName("file_upload");
		String filePath = "";
		filePath = fileSavePath + "/" + upload;
		
		File cloudinaryFile = new File(uploadPath + "\\" + upload);
		Map uploadResult = cloudinary.uploader().upload(cloudinaryFile, ObjectUtils.emptyMap());
		String trainerFile = (String) uploadResult.get("url");
		
		String gymName = multi.getParameter("gym_name_txt");
		String gymLocation = multi.getParameter("gym_location_txt");
		System.out.println("하하" + gymName);
		System.out.println("호호" + gymLocation);
		MemberVo ssMvo = (MemberVo)request.getSession().getAttribute("ssMvo");
		int memberNo = ssMvo.getMemberNo();
		
		int result = new TrainerService().switchAccount(memberNo, gymName, gymLocation, trainerFile);
		
		if(result == 0) {
			System.out.println("insert 실패");
		} else if(result == 1) {
			System.out.println("insert 성공");
			request.setAttribute("msg", "트레이너 심사 요청되었습니다. 관리자 확인 후, 트레이너 계정으로 전환됩니다.");
			request.getRequestDispatcher("WEB-INF/view/common/pageReplace.jsp").forward(request, response);
		}
	}

}
