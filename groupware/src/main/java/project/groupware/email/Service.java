package project.groupware.email;

import java.util.ArrayList;
import java.util.HashMap;

public interface Service {
	
	void addEmail (Email email);
	
	void addEmails (ArrayList<Email> list);
	
	void addAccount(Email email);
	
	ArrayList<Email> getAll ();
	
	Email getAccount(String member_id);
	
	Email getAccountId(String email_account);
	
	Email getEmail (int email_id);
	
	ArrayList<Email> getSend (HashMap<String, Object> map);
	
	ArrayList<Email> getReceive (HashMap<String, Object> map);
	
	ArrayList<Email> getExReceive (HashMap<String, Object> map);
	
	ArrayList<Email> gettReceiveCount (String receive_id);
	
	ArrayList<Email> getRecycle (HashMap<String, Object> map);
	
	ArrayList<Email> getExRecycle (HashMap<String, Object> map);
	
	void editEmail (Email email);
		
	void deleteEmail (int email_id);
	
	void deleteAccount (String member_id);

}
