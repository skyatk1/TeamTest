package sns.board.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import sns.board.db.BoardDAO;
import sns.board.db.BoardDTO;

public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet()");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("= = = = = = = BoardInsertServlet = = = = = = =");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		
		String email = (String) session.getAttribute("email");
		String imgs = null;
		String video = null;
		
		// 비 로그인 시 로그인 페이지로 이동
		if (email == null) {
			response.sendRedirect("Login.me");
		}
		
		// 파일 저장 경로
		String savePath = request.getServletContext().getRealPath("/upload/board_img");
		// String savePath = "D:/workspace_jsp7/Project/fileupload";
		
		// 파일 최대 크기
		int maxSize = 10 * 1024 * 1024;
		
		// 저장 폴더 없으면 생성
		File file;
		if (!(file = new File(savePath)).isDirectory()) {
			file.mkdirs();
		}
		System.out.println("BoardInsertServlet.java - savePath: " + savePath);
		ArrayList<String> filename = new ArrayList<String>();
		String videoName = null;
		
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", 
				new DefaultFileRenamePolicy());
		
		// 파일처리
		Enumeration<String> files = multi.getFileNames();
		
		while(files.hasMoreElements()){
			String name = files.nextElement();
			
			System.out.println("filename: " + multi.getFilesystemName(name));

			if (multi.getFilesystemName(name).split("\\.")[1].equals("mp4")) {
				videoName = multi.getFilesystemName(name);
			} else {
				filename.add(multi.getFilesystemName(name));
			}
		}
		System.out.println("videoName: " + videoName);
		
		
		System.out.println("BoardInsertServlet.java - filename: " + filename);
		
		System.out.println("BoardInsertServlet.java - filesize: " + filename.size());
		
		if (filename.size() != 0) {
			imgs = "";
			for(int i=0; i<filename.size();i++){
				imgs += filename.get(i) + ",";
			}
		}
		// 파일처리
		
		System.out.println("video: " + video);
		
		BoardDTO bdto = new BoardDTO();
		bdto.setEmail(email);
		bdto.setB_content(multi.getParameter("content"));
		bdto.setImg(imgs);
		bdto.setVideo(videoName);
		
		BoardDAO bdao = new BoardDAO();
		bdao.insertBoard(bdto);
		 
		
	}

}