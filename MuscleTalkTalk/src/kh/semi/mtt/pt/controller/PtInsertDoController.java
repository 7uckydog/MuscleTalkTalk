package kh.semi.mtt.pt.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.semi.mtt.pt.model.service.PtService;
import kh.semi.mtt.pt.model.vo.PtVo;

/**
 * Servlet implementation class PtInsertDoControllerServlet
 */
@WebServlet("/ptinsert.do")
public class PtInsertDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtInsertDoController() {
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

		System.out.println("doPost ptinsert.do");
		String fileSavePath =  "upload";
		String uploadPath =  getServletContext().getRealPath(fileSavePath);
		System.out.println("uploadPath: " + uploadPath);
		// 업로드 할 폴더 존재 여부 확인 후 없다면 생성
		File path = new File(uploadPath);
		if(!path.exists()) {
			path.mkdirs();
		}
		int maxFileSize = 50 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());
		ArrayList<String> uploadList = new ArrayList<String>();
		uploadList.add(multi.getFilesystemName("input_ptimg_file1"));
		uploadList.add(multi.getFilesystemName("input_ptimg_file2"));
		uploadList.add(multi.getFilesystemName("input_ptimg_file3"));
		String ptName = multi.getParameter("pt_name");
		String ptCategoryStr = multi.getParameter("pt_category");
		int ptCategory = 0;
		try {
			ptCategory = Integer.parseInt(ptCategoryStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String ptIntroduce = multi.getParameter("pt_introduce");
		String ptInformation = multi.getParameter("pt_information");
		String ptTargetStudent = multi.getParameter("pt_target_student");
		String ptTrainerInfo = multi.getParameter("pt_trainer_info");
		String ptNotice = multi.getParameter("pt_notice");
		String ptTimeInfo = multi.getParameter("pt_time_info");
		String ptPriceStr = multi.getParameter("pt_price");
		String ptStartDate = multi.getParameter("pt_start_date");
		String ptEndDate = multi.getParameter("pt_end_date");
		int ptPrice = -1;
		try {
			ptPrice = Integer.parseInt(ptPriceStr);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		PtVo ptVo = new PtVo();
		ptVo.setPtName(ptName);
		ptVo.setPtCategory(ptCategory);
		ptVo.setPtIntroduce(ptIntroduce);
		ptVo.setPtInformation(ptInformation);
		ptVo.setPtTargetStudent(ptTargetStudent);
		ptVo.setPtTrainerInfo(ptTrainerInfo);
		ptVo.setPtNotice(ptNotice);
		ptVo.setPtTimeInfo(ptTimeInfo);
		ptVo.setPtPrice(ptPrice);
		ptVo.setPtStartDate(ptStartDate);
		ptVo.setPtEndDate(ptEndDate);
		System.out.println("ptinsert.do에서 입력받은 ptVo 데이터 값:  " + ptVo);
		
		ArrayList<String> ptFilePathList = new ArrayList<String>();
		for(int i=0; i<uploadList.size(); i++) {
			ptFilePathList.add(fileSavePath +"/" + uploadList.get(i));
		}
		System.out.println("ptinsert.do에서 입력받은 ptVo 이미지 데이터 값:" + uploadList);
		System.out.println("ptinsert.do에서 입력받은 ptVo 이미지 저장 경로:" + ptFilePathList);
		ptVo.setPtFilePathList(ptFilePathList);
		
		int result = new PtService().insertPt(ptVo);
		System.out.println("ptinsert.do에서의 result값:  " + result);
		
		if(result != 0) {
			System.out.println("ptinsert.do에서 pt프로그램 insert 성공함");
			System.out.println("ptinsert.do에서 ptlist페이지로 이동함");
			response.sendRedirect("ptlist");
		} else {
			System.out.println("ptinsert.do에서 pt프로그램 insert 실패함");
			System.out.println("/ptinsert 페이지로 이동함");
			response.sendRedirect("ptinsert");
		}
		
		
		
		
		
		
		
		
		

	}

}
