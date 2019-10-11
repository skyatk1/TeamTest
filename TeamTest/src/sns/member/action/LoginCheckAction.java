package sns.member.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sns.member.db.MemberDAO;

public class LoginCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		System.out.println("설정 전 : " + forward.getPath());
		System.out.println("설정 전 : " + forward.isRedirect());
		
		HttpSession session = request.getSession();
		if (session.getAttribute("email") != null) {
			forward.setPath("./Main.me");
			forward.setRedirect(true);

			return forward;
		}
		
		Cookie[] cookies = request.getCookies();
		String cookieE = "";
		String cookieI = "";
		
		
		if(cookies != null){
			for(Cookie c : cookies){
				if(c.getName().equals("AutoLog")){//email이 저장된 쿠키
					cookieE=c.getValue();
					System.out.println("AutoLog: "+cookieE);
				}
				if(c.getName().equals("AutoLogI")){//ip가 저장된 쿠키
					cookieI=c.getValue();
					System.out.println("AutoLogI: "+cookieI);
				}			
			}
			
			if(cookieI!=null&&cookieE!=null){
				if(cookieI.equals(request.getRemoteAddr())){//쿠키에 저장된 ip가 현재의 ip와 같고
					
					MemberDAO mdao=new MemberDAO();
					String check = mdao.emailCheck(cookieE);//email이 db에 저장되어 있다면
					if(check.equals("1")){
						
						HttpSession sessionAutoLog=request.getSession();//세션을 만들어
						request.setAttribute("email", cookieE);
						System.out.println("AUTOLOGIN-----");
						
						forward.setPath("./Main.me");//메인으로 보내준다 
						forward.setRedirect(true);
						
						return forward;
					
					}else{//쿠키의 ip와 ip는 같지만 db에 존재하지 않는 email라면
						System.out.println("존재하지 않는 email이므로 쿠키 삭제");
						Cookie cookie=new Cookie("AutoLog",null);
						cookie.setMaxAge(0);
						response.addCookie(cookie);
						Cookie cookieP=new Cookie("AutoLogI",null);
						cookieP.setMaxAge(0);
						response.addCookie(cookie);	
						
						forward.setPath("./member/login.jsp");
						forward.setRedirect(false);
						
						return forward;
						
					}
				}
			}
			
		}
		
		forward.setPath("./member/login.jsp");
		forward.setRedirect(false);
		
		System.out.println("path : " + forward.getPath());
		System.out.println("isredirect : " + forward.isRedirect());
		
		return forward;
	}
	
}
