package sns.member.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Cookie AutoLog = new Cookie("AutoLog", null);
		Cookie AutoLogI = new Cookie("AutoLogI", null);
		
		AutoLog.setMaxAge(0);
		AutoLogI.setMaxAge(0);
		
		response.addCookie(AutoLog);
		response.addCookie(AutoLogI);
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Login.me");
		forward.setRedirect(true);
		
		
		return forward;
	}
	
}
