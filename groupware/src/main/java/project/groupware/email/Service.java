package project.groupware.email;

import java.util.ArrayList;

public interface Service {

	void addEmail(Email email);
	
	Email getEmail(int email_id);
	
	ArrayList<Email> getSend(int send_member_id);
	
	ArrayList<Email> getReceive(int receive_member_id);

	ArrayList<Email> getRecycle(int send_member_id);
	
	void EditSendDelete(int email_id);
	
	void EditSendRestore(int email_id);
	
	void EditReceiveDelete(int email_id);
	
	void EditReceiveRestore(int email_id);
	
	void EditRecycleSend(int email_id);
	
	void EditRecycleReceive(int email_id);
}
