package sns.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sns.member.db.MemberDAO;

public class EmailAuthCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String sendCode = (String)session.getAttribute("code"); // 유저한테 보낸 코드
		String inputCode = request.getParameter("emailCode"); // 유저가 입력한 코드
		String email = (String)session.getAttribute("email");
		
		ActionForward forward = new ActionForward();
		
		if(sendCode.equals(inputCode)) {
			int result = new MemberDAO().emailCodeCheck(email);
			
			if(result == 1) {
				session.removeAttribute("code");
								
				forward.setPath("./Main.me");
				forward.setRedirect(true);
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("	alert('코드가 일치하지 않습니다.');");
				script.println("	history.back();");
				script.println("</script>");
				script.close();
				
				return null;
			}
			
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("	alert('코드가 일치하지 않습니다.');");
			script.println("	history.back();");
			script.println("</script>");
			script.close();
			
			return null;
		}
		
		
		return forward;
	}
	
}
