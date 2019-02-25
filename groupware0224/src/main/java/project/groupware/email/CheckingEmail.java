package project.groupware.email;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Store;

public class CheckingEmail {
	
	public CheckingEmail() {}

	public ArrayList<Email> receive(String id, String pw) {

	      String host = "pop.gmail.com";// change accordingly
	      String mailStoreType = "pop3";
	      String username = id; // "hongkd12341234@gmail.com";// change accordingly
	      String password = pw; // "hong1234$";// change accordingly

	      return check(host, mailStoreType, username, password);

	   }

	   public static ArrayList<Email> check(String host, String storeType, String user, String password) 
	   {
		   ArrayList<Email> list = new ArrayList<Email>();
	      try {

	      //create properties field
	      Properties properties = new Properties();

	      properties.put("mail.pop3.host", host);
	      properties.put("mail.pop3.port", "995");
	      properties.put("mail.pop3.starttls.enable", "true");
	      Session emailSession = Session.getDefaultInstance(properties);
	  
	      //create the POP3 store object and connect with the pop server
	      Store store = emailSession.getStore("pop3s");

	      store.connect(host, user, password);

	      //create the folder object and open it
	      Folder emailFolder = store.getFolder("INBOX");
	      emailFolder.open(Folder.READ_ONLY);

	      // retrieve the messages from the folder in an array and print it
	      Message[] messages = emailFolder.getMessages();
	      System.out.println("messages.length---" + messages.length);

	      for (int i = 0, n = messages.length; i < n; i++) {
	         Message message = messages[i];
	         System.out.println("---------------------------------");
	         System.out.println("Email Number " + (i + 1));
	         System.out.println("Subject: " + message.getSubject());
	         System.out.println("From: " + message.getFrom()[0]);
	         System.out.println("Text: " + message.getContent().toString());
	         System.out.println("To: " + message.getRecipients(Message.RecipientType.TO)[0]);
	         System.out.println("Text1: " + message.getContentType());
	         System.out.println("Text2: " + message.getDescription());
	         System.out.println("Text3: " + message.getDisposition());
	         System.out.println("Text4: " + message.getFileName());
	         System.out.println("Text5: " + message.getLineCount());
	         System.out.println("Text6: " + message.getMessageNumber());
	         System.out.println("Text7: " + message.getSize());
	         
	         System.out.println("Text6: " + message.getSentDate());
	         System.out.println("Text8: " + message.getReceivedDate());
	         
	         
	         String[] sender = message.getFrom()[0].toString().split(" <|>");
	         String receiver = message.getRecipients(Message.RecipientType.TO)[0].toString();
	         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	         Email mail = new Email();
	         mail.setSender_id(sender[1]);
	         mail.setSender(sender[0]);
	         mail.setReceiver_id(user);
	         mail.setReceiver(user);
	         mail.setTitle(message.getSubject());
	         mail.setContent(message.getContent().toString());
//	         mail.setSend_date((Date)sdf.format(message.getSentDate()));
	         System.out.println(mail);
	         list.add(0,mail);

	      }

	      //close the store and folder objects
	      emailFolder.close(false);
	      store.close();

	      } catch (NoSuchProviderException e) {
	         e.printStackTrace();
	      } catch (MessagingException e) {
	         e.printStackTrace();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
	}
