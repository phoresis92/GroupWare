package project.groupware.email;

import java.util.ArrayList;

public interface Service {
	
	void addEmail (Email email);
	
	void addEmails (ArrayList<Email> list);
	
	void addAccount(Email email);
	
	Email getEmail (int email_id);
	
	Email getAccount(String member_id);
	
	ArrayList<Email> getAll ();
	
	ArrayList<Email> getSend (String send_id);
	
	ArrayList<Email> getReceive (String receive_id);
		
	void deleteEmail (int email_id);
	
	void deleteAccount (String member_id);

}
