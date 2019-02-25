package project.groupware.email;

import java.util.ArrayList;

public interface Dao {
	
	void insert (Email email);
	
	void insertAccount(Email email);

	Email selectEmail (int email_id);
	
	Email selectId(Email email);
	
	ArrayList<Email> selectAll ();
	
	Email selectAccount(int member_id);
	
	ArrayList<Email> selectSend (String sender_id);
	
	ArrayList<Email> selectReceive (String receive_id);
		
	void updateAccount (Email email);
	
	void delete (int email_id);

}
