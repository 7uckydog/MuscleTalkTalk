package kh.semi.mtt.pt;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class PtInsertDoControllerServlet
 */
@WebServlet("/ptinsert.do")
public class PtInsertDoControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtInsertDoControllerServlet() {
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
		String upload = multi.getFilesystemName("input_ptimg_file");
		System.out.println(upload);
	}

}
