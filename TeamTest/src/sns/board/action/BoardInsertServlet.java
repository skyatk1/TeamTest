package sns.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sns.board.db.BoardDTO;


public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		if (email == null) {
			response.sendRedirect("Login.me");
		}
		
		BoardDTO bdto = new BoardDTO();
		
		bdto.setEmail(email);
		bdto.setB_content(request.getParameter("content"));
		
		
		
	}

}