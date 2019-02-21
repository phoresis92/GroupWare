package project.groupware.email;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Store;

import org.apache.commons.fileupload.util.mime.MimeUtility;

public class FetchingEmail {

	public FetchingEmail() {
	}

	public ArrayList<Email> receive(String id, String pw) {

		String host = "pop.gmail.com";// change accordingly
		String mailStoreType = "pop3";
		String username = id; // "hongkd12341234@gmail.com";// change accordingly
		String password = pw; // "hong1234$";// change accordingly

		// Call method fetch
		return fetch(host, mailStoreType, username, password);

	}

	public static ArrayList<Email> fetch(String pop3Host, String storeType, String user, String password) {
		ArrayList<Email> list = new ArrayList<Email>();
		try {
			// create properties field
			Properties properties = new Properties();
			properties.put("mail.store.protocol", "pop3");
			properties.put("mail.pop3.host", pop3Host);
			properties.put("mail.pop3.port", "995");
			properties.put("mail.pop3.starttls.enable", "true");
			Session emailSession = Session.getDefaultInstance(properties);
			// emailSession.setDebug(true);

			// create the POP3 store object and connect with the pop server
			Store store = emailSession.getStore("pop3s");

			store.connect(pop3Host, user, password);

			// create the folder object and open it
			Folder emailFolder = store.getFolder("INBOX");
			emailFolder.open(Folder.READ_ONLY);

			// retrieve the messages from the folder in an array and print it
			Message[] messages = emailFolder.getMessages();			
			System.out.println("messages.length---" + messages.length);

			for (int i = 0; i < messages.length; i++) {
				Message message = messages[i];
				System.out.println("---------------------------------");
				Email email = new Email();
				java.sql.Date date = new java.sql.Date(message.getSentDate().getTime());
				email.setSend_date(date);
				email.setEmail_path("");
				writePart(message, email);
				list.add(email);
			}

			// close the store and folder objects
			emailFolder.close(false);
			store.close();

		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/*
	 * This method checks for content-type based on which, it processes and fetches
	 * the content of the message
	 */
	public static void writePart(Part p, Email email) throws Exception {

		if (p instanceof Message) {
			// Call method writeEnvelope
			// writeEnvelope((Message) p); // 정보 출력
			System.out.println("This is the message envelope");
			System.out.println("---------------------------");
			Message m = (Message) p;
			Address[] a;

			// FROM
			if ((a = m.getFrom()) != null) {
				for (int j = 0; j < a.length; j++) {
					String sender = MimeUtility.decodeText(a[j].toString());
					System.out.println("FROM: " + sender);
					
					String[] arr = sender.split(" <|>");
					if (arr.length > 1) {
						email.setSender_id(arr[1]);
						email.setSender(arr[0]);
					} else {
						email.setSender_id(arr[0]);
						email.setSender(arr[0]);
					}
				}
			}

			// TO
			if ((a = m.getRecipients(Message.RecipientType.TO)) != null) {
				for (int j = 0; j < a.length; j++) {
					String receiver = MimeUtility.decodeText(a[j].toString());
					System.out.println("TO: " + receiver);
					String[] arr = receiver.split(" <|>");
					if (arr.length > 1) {
						email.setReceiver_id(arr[1]);
						email.setReceiver(arr[0]);
					} else {
						email.setReceiver_id(arr[0]);
						email.setReceiver(arr[0]);
					}					
				}
			}

			// SUBJECT
			if (m.getSubject() != null) {
				System.out.println("SUBJECT: " + m.getSubject());
				email.setTitle(m.getSubject());
			}
		}

		System.out.println("----------------------------");
		System.out.println("CONTENT-TYPE: " + p.getContentType());

		// check if the content is plain text
		if (p.isMimeType("text/plain")) {
			System.out.println("This is plain text");
			System.out.println("---------------------------");
			System.out.println((String) p.getContent());
			email.setContent_plain((String)p.getContent());
		}
		// check if the content has attachment
		else if (p.isMimeType("multipart/*")) {
			System.out.println("This is a Multipart");
			System.out.println("---------------------------");
			Multipart mp = (Multipart) p.getContent();
			int count = mp.getCount();
			for (int i = 0; i < count; i++)
				writePart(mp.getBodyPart(i), email);
		}
		// check if the content is a nested message
		else if (p.isMimeType("message/rfc822")) {
			System.out.println("This is a Nested Message");
			System.out.println("---------------------------");
			writePart((Part) p.getContent(), email);
		}
		// check if the content is an inline image
		else if (p.isMimeType("image/jpeg")) {
			System.out.println("--------> image/jpeg");
			Object o = p.getContent();

			InputStream x = (InputStream) o;
			// Construct the required byte array
			System.out.println("x.length = " + x.available());
			int i = 0;
			byte[] bArray = new byte[x.available()];
			while ((i = (int) ((InputStream) x).available()) > 0) {
				int result = (int) (((InputStream) x).read(bArray));
				if (result == -1) { break; }
				String path = "c://tmp/";
				String name = p.getContentType().split("\"")[1];
				email.setEmail_path(path+"_"+i+"_"+name);
				FileOutputStream f2 = new FileOutputStream(path+"_"+i+"_"+name);
				f2.write(bArray);					
			}
		} else if (p.getContentType().contains("image/")) {
			System.out.println("content type" + p.getContentType());
			File f = new File("image" + new Date().getTime() + ".jpg");
			DataOutputStream output = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(f)));
			com.sun.mail.util.BASE64DecoderStream test = (com.sun.mail.util.BASE64DecoderStream) p.getContent();			
//			email.setContent(test.toString());
			byte[] buffer = new byte[1024];
			int bytesRead;
			while ((bytesRead = test.read(buffer)) != -1) {
				output.write(buffer, 0, bytesRead);
			}
		} else {
			Object o = p.getContent();
			if (o instanceof String) {
				System.out.println("This is a string");
				System.out.println("---------------------------");
				System.out.println((String) o);
				email.setContent_html((String)o);
				email.setContent((String)o);
			} else if (o instanceof InputStream) {
				System.out.println("This is just an input stream");
				System.out.println("---------------------------");
				InputStream is = (InputStream) o;
				is = (InputStream) o;
				int c;
				while ((c = is.read()) != -1)
					System.out.write(c);
			} else {
				System.out.println("This is an unknown type");
				System.out.println("---------------------------");
				System.out.println(o.toString());
			}
		}
	}
}
