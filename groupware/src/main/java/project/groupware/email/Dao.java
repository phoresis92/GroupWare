package project.groupware.email;

import java.util.ArrayList;
import java.util.HashMap;

public interface Dao {
	
	void insert (Email email);
	
	void insertExternal_mail (Email email);
	
	void insertAccount(Email email);

	ArrayList<Email> selectAll();
	
	Email selectId(Email email);
	
	Email selectAccount(String member_id);
	
	Email selectAccountId(String email_account);
	
	Email selectEmail (int email_id);
		
	ArrayList<Email> selectSend (HashMap<String, Object> map);
	
	ArrayList<Email> selectReceive (HashMap<String, Object> map);
	
	ArrayList<Email> selectExReceive (HashMap<String, Object> map);
	
	ArrayList<Email> selectReceiveCount (String receive_id);
	
	ArrayList<Email> selectRecycle (HashMap<String, Object> map);
	
	ArrayList<Email> selectExRecycle (HashMap<String, Object> map);
		
	void updateEmail (Email email);
	
	void updateAccount (Email email);
	
	void delete (int email_id);

	void deleteAccount (String member_id);
}
