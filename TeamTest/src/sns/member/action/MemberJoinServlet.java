package sns.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sns.member.db.MemberDAO;
import sns.member.db.MemberDTO;


public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		MemberDTO mdto = new MemberDTO();
		mdto.setEmail(request.getParameter("email"));
		mdto.setPassword(request.getParameter("pass"));
		mdto.setF_name(request.getParameter("f_name"));
		mdto.setL_name(request.getParameter("l_name"));
		mdto.setGender(request.getParameter("gender"));
		mdto.setIp(request.getRemoteAddr());
		
		MemberDAO mdao = new MemberDAO();
		String result = mdao.insertMember(mdto);
		System.out.println("result: " + result);
		
		if (result.equals("1")) {
			HttpSession session = request.getSession();
			session.setAttribute("email", request.getParameter("email"));
		}
		
		PrintWriter script = response.getWriter();
		script.println(result);
		script.close();
		
		
		
	}

}
