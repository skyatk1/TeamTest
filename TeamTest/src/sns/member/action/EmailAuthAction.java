package sns.member.action;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EmailAuthAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		if(email == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("	alert('로그인을 해주세요');");
			script.println("	location.href='./Login.me'");
			script.println("</script>");
			script.close();
			
			return null;
		}

		String host = "http://localhost:8080/SnsProject/";
		String from = "zukunft89@gmail.com";
		String to = email;
		String code = new SHA256().getSHA256(to);
		String subject = "회원가입을 위한 이메일 인증 메일입니다.";
		String content = "<!DOCTYPE html>\r\n" + 
				"<html lang=\"en\">\r\n" + 
				"<head><title>Emogrifier Example</title></head>\r\n" + 
				"<body style='font: 11px/20px Georgia, \"Times New Roman\", Times, serif;'>\r\n" + 
				"    <div id=\"container\" style=\"margin: 1em auto;\">\r\n" + 
				"        <h1 style=\"font-weight: bold; font-size: 2em;\">아래의 코드를 입력하여 인증을 완료해주세요</h1>\r\n<br><br>" + 
				"        <p style=\"margin-bottom: 1em; font-family: sans-serif; text-align: justify;\">" + code + "</p>\r\n" + 
				"    </div>\r\n" + 
				"</body>\r\n" + 
				"</html>";
		session.setAttribute("code", code);

		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		ActionForward forward = new ActionForward();

		try {
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
			
			
			forward.setPath("./member/email_auth.jsp");
			forward.setRedirect(false);

		} catch (Exception e) {
			e.printStackTrace();
		
		}

		return forward;
	}
	
}
