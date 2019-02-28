package project.groupware.email;

import java.util.ArrayList;

public interface Dao {
	
	void insert (Email email);
	
	void insertAccount(Email email);

	Email selectEmail (int email_id);
	
	Email selectId(Email email);
	
	ArrayList<Email> selectAll ();
	
	Email selectAccount(String member_id);
	
	ArrayList<Email> selectSend (String sender_id);
	
	ArrayList<Email> selectReceive (String receive_id);
		
	void updateAccount (Email email);
	
	void delete (int email_id);

	void deleteAccount (String member_id);
}
