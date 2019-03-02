package project.groupware.email;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class SendEmail {

	public SendEmail() {}

	public void send(Email mail) {	

		String mailProtocol = "smtp";

		String mailHost = "smtp.gmail.com";

		String mailPort = "587";

		String mailId = mail.getEmail_account(); // "hongkd12341234@gmail.com"; // 구글계정

		String mailPassword = mail.getEmail_pw(); // "hong1234$"; // 구글계정 비밀번호 

		String fromName = mail.getSender(); // "보내는사람이름";

		String fromEmail = mail.getSender_id(); // "hongkd12341234@gmail.com"; // 보내는 사람 메일

		String toName = mail.getReceiver(); // "받는사람이름";

		String toEmail = mail.getReceiver_id(); // 받는사람메일

		String mailTitle = mail.getTitle(); // "메일 타이틀입니다.";

		String mailContents = mail.getContent(); // "메일 내용입니다.";

		String debugMode = "false";

		String authMode = "true";		

		try {
			boolean debug = Boolean.valueOf(debugMode).booleanValue();

			Properties mailProps = new Properties();

			mailProps.put("mail.smtp.starttls.enable", "true");

			mailProps.setProperty("mail.transport.protocol", mailProtocol); 

			mailProps.put("mail.debug", debugMode);

			mailProps.put("mail.smtp.host", mailHost);

			mailProps.put("mail.smtp.port", mailPort);

			mailProps.put("mail.smtp.connectiontimeout", "5000");

			mailProps.put("mail.smtp.timeout", "5000");  

			mailProps.put("mail.smtp.auth", authMode);

			
			Session msgSession = null;

			if(authMode.equals("true")) {
		        Authenticator auth = new MyAuthentication(mailId, mailPassword);
				msgSession = Session.getInstance(mailProps, auth);
			} else {
				msgSession = Session.getInstance(mailProps, null); 
			}			

			msgSession.setDebug(debug);			

			MimeMessage msg = new MimeMessage(msgSession);
			
			msg.setFrom(new InternetAddress(fromEmail, fromName));

			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail, toName));

			msg.setSubject(MimeUtility.encodeText(mailTitle, "UTF-8", "B"));

			msg.setContent(mailContents, "text/html; charset=UTF-8");

			// 스태틱함수로 직접 보내지 않고 객체를 이용해서 보내고 객체를 닫아준다. 

			Transport t = msgSession.getTransport(mailProtocol);

			try {
				t.connect();
				t.sendMessage(msg, msg.getAllRecipients());
			} finally {
			  t.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}

class MyAuthentication extends Authenticator {

    PasswordAuthentication pa;

    public MyAuthentication(String mailId, String mailPass) {
        pa = new PasswordAuthentication(mailId, mailPass);  
    }

    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
