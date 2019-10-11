package sns.member.action;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
			
		return new PasswordAuthentication("zukunft89", "dhkteltu0!");
	}
	
}
